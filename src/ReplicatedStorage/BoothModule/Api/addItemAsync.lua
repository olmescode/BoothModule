local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local MarketplaceService = game:GetService("MarketplaceService")

local BoothModule = script:FindFirstAncestor("BoothModule")

local t = require(BoothModule.Packages.t)
local types = require(BoothModule.types)
local constants = require(BoothModule.constants)
local setItemInfo = require(BoothModule.Actions.setItemInfo)
local matchIdToType = require(BoothModule.Modules.matchIdToType)
local getOrCreateInstanceOfName = require(BoothModule.Modules.getOrCreateInstanceOfName)

local function loadAsset(itemInfo: types.ItemInfo): Instance
	local asset
	
	if itemInfo.productType == Enum.InfoType.GamePass or itemInfo.productType == Enum.InfoType.Product then
		local assetTemplate = BoothModule.StandPromtApp.Templates.AssetTemplate
		asset = assetTemplate:Clone()
		
		local thumbnail = asset.Thumbnail
		local name = asset.Names
		local price = asset.PriceLabel.Text

		thumbnail.Image = "rbxthumb://type=Asset&id=" .. itemInfo.iconId .. "&w=150&h=150"
		name.Text = itemInfo.title
		price.Text = itemInfo.price
	end
	
	asset.Name = itemInfo.assetId
	asset.Visible = true
	asset.Name = itemInfo.assetId
	asset.Parent = getOrCreateInstanceOfName(
		constants.Instances.AssetsFolder.name,
		constants.Instances.AssetsFolder.instanceType
	)
	return asset
end

return function(store: any)
		--[=[
		Asyncronously add an item to the Shop System so that it can be purchased
		in the experience.

		The AssetId is the number that appears in the URL when navigating to an
		item's catalog page.

		Passing "true" as the second optional argument will prevent the item
		from being displayed in the "Catalog" view. The only way for users
		to access it would be by defining a proximity button for it (see the
		AddProximityButton function).

		```lua
		local ReplicatedStorage = game:GetService("ReplicatedStorage")

		local StandModule = require(ReplicatedStorage:WaitForChild("StandModule"))

		StandModule.addItemAsync(4794106130)
		```
		@server
		@yields
	]=]
	local function addItemAsync(assetId: number, productType: Enum.InfoType?, hideFromCatalog: boolean?)
		assert(RunService:IsServer(), "MerchBooth.addItemAsync must be called on the server")
		assert(t.number(assetId), "Bad argument #1 to MerchBooth.addItemAsync: expected a number")
		assert(t.enum(Enum.InfoType), "Bad argument #2 to MerchBooth.addItemAsync: expected a Enum.InfoType")
		assert(
			t.optional(t.boolean)(hideFromCatalog),
			"Bad argument #3 to MerchBooth.addItemAsync: expected a boolean or nil"
		)
		
		productType = productType or Enum.InfoType.Asset
		
		local info = MarketplaceService:GetProductInfo(assetId, productType) -- yields
		local assetType = matchIdToType(info.AssetTypeId)
		
		local itemInfo: types.ItemInfo = {
			assetId = assetId,
			title = info.Name,
			description = info.Description,
			price = if info.IsForSale
				then info.PriceInRobux
				elseif info.IsPublicDomain then 0 -- Free item
				else -1, -- Not for sale
			assetType = assetType,
			creatorName = info.Creator.Name,
			creatorType = if info.Creator.CreatorType then Enum.CreatorType[info.Creator.CreatorType] else nil,
			hiddenFromCatalog = if hideFromCatalog then true else false,
			isOwned = false,
			productType = productType,
			iconId = if info.IconImageAssetId ~= 0 then info.IconImageAssetId else assetId,
		}
		itemInfo.productObject = loadAsset(itemInfo)

		store:dispatch(setItemInfo(tostring(assetId), itemInfo))
	end
	
	return addItemAsync
end
