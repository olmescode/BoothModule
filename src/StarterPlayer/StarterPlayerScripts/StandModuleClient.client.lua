local ReplicatedStorage = game:GetService("ReplicatedStorage")

local BoothModule = require(ReplicatedStorage:WaitForChild("BoothModule"))

local enviromentFolder = workspace:WaitForChild("Enviroment")
local boothFolder = enviromentFolder:WaitForChild("BoothSpawners")

-- Define the onPromptTriggered function
local function onPromptTriggered(prompt)
	print("onPromptTriggered called")
	BoothModule.claimBooth(prompt, boothFolder)
end

-- Connect the onPromptTriggered function to each ProximityPrompt
for _, booth in ipairs(boothFolder:GetChildren()) do
	local prompt = booth:FindFirstChild("ProximityPrompt", true)
	if prompt then
		prompt.Triggered:Connect(function()
			onPromptTriggered(prompt)
		end)
	end
end
