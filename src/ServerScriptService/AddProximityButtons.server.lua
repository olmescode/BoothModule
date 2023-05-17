local ReplicatedStorage = game:GetService("ReplicatedStorage")

local BoothModule = require(ReplicatedStorage:WaitForChild("BoothModule"))

local enviromentFolder = workspace:WaitForChild("Enviroment")
local spawnerFolder = enviromentFolder:WaitForChild("BoothSpawners")

local remotes = BoothModule.remotes

for _, spawner in ipairs(spawnerFolder:GetChildren()) do
	local proximityButton = spawner:FindFirstChild("ProximityPrompt", true)
	if proximityButton then
		BoothModule.addProximityButton(proximityButton)
	end
end
