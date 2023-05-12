local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local BoothModule = require(ReplicatedStorage:WaitForChild("BoothModule"))
local remotes = BoothModule.remotes


remotes.BoothClaim.OnServerEvent:Connect(function(player, prompt)
	BoothModule.onBoothClaim(player, prompt)
end)

