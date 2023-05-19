local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local MarketplaceService = game:GetService("MarketplaceService")

local BoothModule = script:FindFirstAncestor("BoothModule")

local t = require(BoothModule.Packages.t)
local claimBooth = require(BoothModule.Actions.claimBooth)
local setItemInfo = require(BoothModule.Actions.setItemInfo)

return function(store: any)
	local player = Players.LocalPlayer
	local connections = {}
	
	local function updateItemInfo(id: string, info: table)
		local isOwned = false
		if info.productType == Enum.InfoType.Asset then
			isOwned = MarketplaceService:PlayerOwnsAsset(player, id) -- yields
		elseif info.productType == Enum.InfoType.GamePass then
			isOwned = MarketplaceService:UserOwnsGamePassAsync(player.UserId, id)
		end

		info.isOwned = isOwned
		store:dispatch(setItemInfo(id, info))
	end
	
	--[=[
		Sets whether the entire BoothModule is enabled.

		```lua
		local ReplicatedStorage = game:GetService("ReplicatedStorage")

		local BoothModule = require(ReplicatedStorage:WaitForChild("BoothModule"))

		BoothModule.setEnabled(true)
		```

		@within BoothModule
		@client
	]=]
	local function setEnabled(
		isEnabled: boolean,
		initialLoadDataRemote: RemoteEvent?,
		playParticleEmitterRemote: RemoteEvent?
	)
		assert(RunService:IsClient(), "BoothModule.setEnabled must be called on the client")
		assert(t.boolean(isEnabled), "Bad argument #1 to BoothModule.setEnabled: expected a boolean")
		
		-- Setting up connections
		initialLoadDataRemote = initialLoadDataRemote or BoothModule.Remotes.InitialLoadData
		playParticleEmitterRemote = playParticleEmitterRemote or BoothModule.Remotes.PlayParticleEmitter
		
		if isEnabled then
			connections.initialLoadEventConnection = initialLoadDataRemote.OnClientEvent:Connect(
				function(assetObjects, proximityButtons)
					for id, info in pairs(assetObjects) do
						updateItemInfo(id, info)
					end
					for _, proximityButton in ipairs(proximityButtons) do
						store:dispatchProximityButton(proximityButton)
					end
				end
			)
			
			connections.characterAddedConnection = player.CharacterAdded:Connect(function()
				
			end)
			
			connections.playParticleEmitterConnection = playParticleEmitterRemote.OnClientEvent:Connect(function()
				local emitter = BoothModule.ParticleEmitter:Clone()
				emitter.Parent = player.Character.Humanoid.RootPart --??
				emitter:Emit(15)

				task.wait()
				if emitter.Parent then
					emitter.Enabled = false
				end

				task.wait(4)
				if emitter.Parent then
					emitter:Destroy()
				end
			end)
		end
	end
	
	return setEnabled
end
