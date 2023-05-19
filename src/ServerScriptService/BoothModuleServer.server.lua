local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CollectionService = game:GetService("CollectionService")

local BoothModule = require(ReplicatedStorage:WaitForChild("BoothModule"))

local initialLoadData = BoothModule.remotes.InitialLoadData :: RemoteEvent

local connections = {}

local function setup()
	local spawners = CollectionService:GetTagged("Spawners")
	
	for _, spawner in ipairs(spawners) do
		local proximityButton = spawner:FindFirstChild("ProximityPrompt", true)
		
		if proximityButton then
			BoothModule.addProximityButton(proximityButton)
		end
	end
	
	connections[1] = Players.PlayerAdded:Connect(function(player)
		BoothModule.onPlayerEntered(player, initialLoadData)
	end)
	
	connections[2] = Players.PlayerRemoving:Connect(function(player)
		--BoothModule.onPlayerRemoved(player)
	end)
end

setup()
