local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local BoothModule = script:FindFirstAncestor("BoothModule")

local t = require(BoothModule.Packages.t)
local claimBooth = require(BoothModule.Actions.claimBooth)

local initialLoadData = BoothModule.Remotes.InitialLoadData :: RemoteEvent

return function(store: any)
	local connections = {}
	
	local function setEnabled(isEnabled: boolean)
		assert(RunService:IsClient(), "BoothModule.setEnabled must be called on the client")
		assert(t.boolean(isEnabled), "Bad argument #1 to BoothModule.setEnabled: expected a boolean")
		
		if isEnabled then
			connections.initialLoadEventConnection = initialLoadData.OnClientEvent:Connect(
				function(proximityButtons)
					for _, proximityButton in ipairs(proximityButtons) do
						-- Conect to the function claimBooth
						proximityButton.Triggered:Connect(function(player)
							claimBooth(proximityButton, store)
						end)
					end
				end
			)
		end
	end
	
	return setEnabled
end
