local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local BoothModule = script:FindFirstAncestor("BoothModule")

local t = require(BoothModule.Packages.t)

local initialLoadData = BoothModule.Remotes.InitialLoadData :: RemoteEvent

return function(isEnabled: boolean)
	assert(RunService:IsClient(), "MerchBooth.setEnabled must be called on the client")
	assert(t.boolean(isEnabled), "Bad argument #1 to MerchBooth.setEnabled: expected a boolean")
	
	local connections = {}
	
	local function setEnabled()
		if isEnabled then
			connections.initialLoadEventConnection = initialLoadData.OnClientEvent:Connect(
				function(proximityButtons)
					for _, proximityButton in ipairs(proximityButtons) do
						-- Conect to a function on Cliente --???
						
					end
				end
			)
		end
	end
end
