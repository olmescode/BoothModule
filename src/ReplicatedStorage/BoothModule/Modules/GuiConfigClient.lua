local Players = game:GetService("Players")
local GuiService = game:GetService("GuiService")
local StarterGui = game:GetService("StarterGui")

local GuiConfigClient = {}
GuiConfigClient.__index = GuiConfigClient

function GuiConfigClient.new()
	
	local self = {
		StarterGui = StarterGui,
		GuiService = GuiService,
		
		player = Players.LocalPlayer,
		disabledGuis = {},
		disabledCoreGuis = {},
	}

	setmetatable(self, GuiConfigClient)

	return self
end

function GuiConfigClient:enable()
	-- Show guis that were hidden by hideGuis()
	for _, gui in ipairs(self.disabledGuis) do
		gui.Enabled = true
	end
	self.disabledGuis = {}

	for _, gui in ipairs(self.disabledCoreGuis) do
		self.StarterGui:SetCoreGuiEnabled(gui, true)
	end
	self.disabledCoreGuis = {}
	
	self.GuiService.TouchControlsEnabled = true
	--self.UserInputService.ModalEnabled = self.modalEnabled
end

function GuiConfigClient:disable()
	-- Hide ScreenGuis
	self.disabledGuis = self:getOtherScreenGuis()
	for _, gui in ipairs(self.disabledGuis) do
		gui.Enabled = false
	end

	-- Hide CoreGuis
	self.disabledCoreGuis = self:getShownCoreGuis()
	--self.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
	for _, gui in ipairs(self.disabledCoreGuis) do
		self.StarterGui:SetCoreGuiEnabled(gui, false)
	end

	-- Hide mobile controls
	--self.GuiService = self.GuiService.TouchControlsEnabled
	self.GuiService.TouchControlsEnabled = false
	
	--self.modalEnabled = self.UserInputService.ModalEnabled
	--self.UserInputService.ModalEnabled = true
end

-- Returns all screen GUI objects
function GuiConfigClient:getOtherScreenGuis()
	local instances = self.player.PlayerGui:GetChildren()
	local showGuis = {}
	for _, instance in ipairs(instances) do	
		if instance:IsA("ScreenGui") and instance.Enabled and instance.Name ~= "MainButtonsApp" then
			table.insert(showGuis, instance)
		end
	end
	
	return showGuis
end

-- Returns all Core GUI objects
function GuiConfigClient:getShownCoreGuis()
	local shownCoreGuis = {}
	for _, coreGui in ipairs(Enum.CoreGuiType:GetEnumItems()) do
		if self.StarterGui:GetCoreGuiEnabled(coreGui) then
			table.insert(shownCoreGuis, coreGui)
		end
	end
	
	return shownCoreGuis
end

return GuiConfigClient
