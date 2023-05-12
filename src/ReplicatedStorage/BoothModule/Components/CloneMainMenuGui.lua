local Players = game:GetService("Players")
local player = Players.LocalPlayer

local function cloneMainMenuGui(mainMenuGui)
	local mainMenuGuiClon = player.PlayerGui.StandPromtApp:FindFirstChild("MainMenuGui")
	
	if not mainMenuGuiClon then
		mainMenuGuiClon = mainMenuGui:Clone()
		mainMenuGuiClon.Name = "MainMenuGui"
		mainMenuGuiClon.Parent = player.PlayerGui.StandPromtApp
	end
end

return cloneMainMenuGui
