local Players = game:GetService("Players")
local player = Players.LocalPlayer
local MarketplaceService = game:GetService("MarketplaceService")

local BoothModule = script:FindFirstAncestor("BoothModule")
local addItemAsync = require(BoothModule.Api.addItemAsync)
local items = require(BoothModule.Items)

local ShopController = {}

local connections = {}

--[[
	Disconnects existing connections
]]
function ShopController.disconnectOldConnections()
	for _, connection in ipairs(connections) do
		if connection then
			connection:Disconnect()
		end
	end
	
	connections = {}
end

function ShopController.addItemAsync()
	for _, assetId in ipairs(items.gamepass) do
		local success, errorMessage = pcall(function()
			local assetObject = addItemAsync(assetId, Enum.InfoType.GamePass)
			ShopController.onButtonShopConnect(assetObject)
		end)
		if not success then
			print(errorMessage)
		end
	end
end

local function promptGamePassPurchase(assetId, productType)
	-- Get the id of the GamePass from the name of the button
	local gamePassId = tonumber(assetId)
	local productType = productType
	
	-- Prompt the player to purchase the GamePass
	if productType == Enum.InfoType.Asset then
		MarketplaceService:PromptPurchase(player, gamePassId)
	elseif productType == Enum.InfoType.GamePass then
		MarketplaceService:PromptGamePassPurchase(player, gamePassId)
	elseif productType == Enum.InfoType.Product then
		MarketplaceService:PromptProductPurchase(player, gamePassId)
	end
end

function ShopController.onButtonShopConnect(assetObject)
	for assetId, itemInfo in pairs(assetObject) do
		local assetId = assetId
		local assetObject = itemInfo.assetObject
		local connection = assetObject.MouseButton1Down:Connect(function()
			promptGamePassPurchase(assetId, itemInfo.productType)
		end)

		table.insert(connections, connection)
	end
end

return ShopController
