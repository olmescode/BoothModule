local Players = game:GetService("Players")
local player = Players.LocalPlayer

local BoothModule = script:FindFirstAncestor("BoothModule")

local constants = require(BoothModule.constants)
local GuiConfigClient = require(BoothModule.Modules.GuiConfigClient)
local getOrCreateInstanceOfName = require(BoothModule.Modules.getOrCreateInstanceOfName)

local boothClaim = BoothModule.Remotes.BoothClaim :: RemoteEvent

local playerGuis = GuiConfigClient.new()

local function disableProximityButtons(proximityButtons)
	for _, proximityButton in ipairs(proximityButtons) do
		if proximityButton then
			proximityButton.Enabled = false
		end
	end
end

local function claimBooth(claimedButton, store)
	local standModel = claimedButton:FindFirstAncestorWhichIsA("Part")
	
	-- Check if the booth is already claimed
	if standModel:GetAttribute("Claimed") then
		return
	end

	-- Create a "Claimed" and "Owner" attribute for the stand model
	standModel:SetAttribute("Claimed", true)
	standModel:SetAttribute("Owner", player.UserId)
	
	-- Disable proximity buttons
	local state = store:getState()
	disableProximityButtons(state.proximityButtons)
	
	-- Show GUI to the local player
	local shopGuiTemplate = BoothModule.BoothPromtApp.MainShopGui
	local mainShopGui = shopGuiTemplate:Clone()
	
	mainShopGui.Parent = getOrCreateInstanceOfName(
		constants.Instances.BoothPromtApp.name,
		constants.Instances.BoothPromtApp.instanceType
	)
	
	-- Get all assetObjects from the data controller
	local assetObjects = state.assetObjects
	for _, assetObject in ipairs(assetObjects) do
		assetObject.Parent = mainShopGui.Container.Content.Background.Body.Content.ScrollingFrame
	end
	
	-- Hide other screen GUIs
	playerGuis:disable()
	
	-- Show the booth prompt app to the player
	local BoothPromtApp = getOrCreateInstanceOfName(
		constants.Instances.BoothPromtApp.name,
		constants.Instances.BoothPromtApp.instanceType
	)
	BoothPromtApp.Parent = player.PlayerGui
	
	-- Fire the booth claim event on the server
	--boothClaim:FireServer(claimedButton)
end

return claimBooth
