local ReplicatedStorage = game:GetService("ReplicatedStorage")

local StandModule = require(ReplicatedStorage:WaitForChild("StandModule"))

local items = {
	4343758,  -- ColdFyre Armor
	28521575,  -- Slime Shield
}

for _, assetId in ipairs(items) do
	local success, errorMessage = pcall(function()
		StandModule.addItemAsync(assetId, Enum.InfoType.GamePass)
	end)
	if not success then
		print(errorMessage)
	end
end