--disable
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local assetObject = script.Parent

assetObject.MouseButton1Down:Connect(function()
	local StandModule = ReplicatedStorage:WaitForChild("StandModule")
	local boothFolder = StandModule:WaitForChild("Booths")
	local boothSpawners = workspace.Enviroment.BoothSpawners
	
	local boothClon = boothFolder.FreeBooth:Clone()
	boothClon.PrimaryPart.Position =  boothSpawners.Spawner1.Position
	boothClon.Parent = workspace
	
	local standPromtApp = Players.LocalPlayer.PlayerGui:WaitForChild("StandPromtApp")
	standPromtApp:Destroy()
end)
