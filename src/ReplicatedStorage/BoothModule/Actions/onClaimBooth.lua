local Players = game:GetService("Players")

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
	
	-- Disable proximity buttons
	local state = store:getState()
	disableProximityButtons(state.proximityButtons)
	
	-- Show GUI to the local player
	local mainShopGui = BoothModule.BoothPromtApp.MainShopGui:Clone()
	
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
	BoothPromtApp.IgnoreGuiInset = true
	BoothPromtApp.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	BoothPromtApp.Parent = Players.LocalPlayer.PlayerGui
end

return claimBooth
