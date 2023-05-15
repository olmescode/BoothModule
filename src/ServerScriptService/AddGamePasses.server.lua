local ReplicatedStorage = game:GetService("ReplicatedStorage")

local StandModule = require(ReplicatedStorage:WaitForChild("StandModule"))

local items = {
	-- Example Gamepasses
	
	169936288,  -- Amanda-Morph
	169936329,  -- Wooly-Morph
	169937081, -- Vip
}

for _, assetId in ipairs(items) do
	local success, errorMessage = pcall(function()
		StandModule.addItemAsync(assetId, Enum.InfoType.GamePass)
	end)
	if not success then
		print(errorMessage)
	end
end
