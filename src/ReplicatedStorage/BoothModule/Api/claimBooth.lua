local Players = game:GetService("Players")
local player = Players.LocalPlayer

local BoothModule = script:FindFirstAncestor("BoothModule")
local cloneMainMenuGui = require(BoothModule.Components.CloneMainMenuGui)
local ShopController = require(BoothModule.Components.ShopController)
local GuiConfigClient = require(BoothModule.Modules.GuiConfigClient)

local mainShopGui = BoothModule.StandPromtApp.MainShopGui
local remotes = BoothModule.Remotes

local playerGuis = GuiConfigClient.new()

local function disableStants(boothFolder)
	for _, booth in ipairs(boothFolder:GetChildren()) do
		local prompt = booth:FindFirstChild("ProximityPrompt", true)
		if prompt then
			prompt.Enabled = false
		end
	end
end

local function claimBooth(prompt, boothFolder)
	local standModel = prompt:FindFirstAncestorWhichIsA("Part")
	
	-- Check if the stand is already claimed
	if standModel:GetAttribute("Claimed") then
		return
	end
	
	-- Disable all stands promts for client
	disableStants(boothFolder)
	
--[[
	if isMainMenuGuiOpen then
		-- Clean up old connections if it exists
		ShopController.disconnectOldConnections()

		isMainMenuGuiOpen:Destroy()
		playerGuis:enable()
	else
		
	end
]]
	
	-- Show GUI to the local player
	cloneMainMenuGui(mainShopGui)

	ShopController.addItemAsync()
	--playerGuis:disable()
	
	-- Fire to the server
	remotes.BoothClaim:FireServer(prompt, prompt)
end

return claimBooth
