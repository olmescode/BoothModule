local ReplicatedStorage = game:GetService("ReplicatedStorage")

local BoothModule = require(ReplicatedStorage:WaitForChild("BoothModule"))
local BoothModuleAPI = require(BoothModule)

BoothModuleAPI.setEnabled(true)
