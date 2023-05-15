local ReplicatedStorage = game:GetService("ReplicatedStorage")

local BoothModule = require(ReplicatedStorage:WaitForChild("BoothModule"))

local enviromentFolder = workspace:WaitForChild("Enviroment")
local spawnerFolder = enviromentFolder:WaitForChild("BoothSpawners")

-- Define the onPromptTriggered function
local function onPromptTriggered(prompt)
	BoothModule.claimBooth(prompt, spawnerFolder)
end

-- Connect the onPromptTriggered function to each ProximityPrompt
for _, spawner in ipairs(spawnerFolder:GetChildren()) do
	local prompt = spawner:FindFirstChild("ProximityPrompt", true)
	if prompt then
		prompt.Triggered:Connect(function()
			onPromptTriggered(prompt)
		end)
	end
end
