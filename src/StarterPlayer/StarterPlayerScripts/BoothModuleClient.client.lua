local ReplicatedStorage = game:GetService("ReplicatedStorage")

local BoothModule = ReplicatedStorage:WaitForChild("BoothModule")
local BoothModuleAPI = require(BoothModule)

BoothModuleAPI.setEnabled(true)
