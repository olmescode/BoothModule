--[[
	MarketplaceService does not expose a type for the result of GetProductInfo,
	so we have to do it ourselves.

	See the GetProductInfo method for more info:
	https://developer.roblox.com/en-us/api-reference/function/MarketplaceService/GetProductInfo
]]
export type ProductInfo = {
	Name: string,
	Description: string,
	PriceInRobux: number,
	Created: string,
	Updated: string,
	ContentRatingTypeId: number,
	MinimumMembershipLevel: number,
	IsPublicDomain: boolean,

	-- Creator Information
	Creator: {
		CreatorType: string,
		CreatorTargetId: number,
		Name: string,
		Id: number,
	},

	-- Assets
	AssetId: number,
	AssetTypeId: number,
	IsForSale: boolean,
	IsLimited: boolean,
	IsLimitedUnique: boolean,
	IsNew: boolean,
	Remaining: number,
	Sales: number,
	SaleAvailabilityLocations: Enum.ProductLocationRestriction,
	CanBeSoldInThisGame: boolean,
	ProductType: string,

	-- Developer Products and Game Passes
	ProductId: number,
	IconImageAssetId: number,
}

--[=[
	@interface ItemInfo

	A table containing information about one of the items that has been
	registered with the Stand System.

	You can interface with these objects using the [MerchBooth.getItems]
	function.

	.assetId number -- Add ID of the item, as passed to [MerchBooth.addItemAsync]
	.title string -- Name of the item as it appears in the catalog
	.price number -- Price in Robux of the item
	.description string -- Description of the item as it appears in the catalog
	.assetType Enum.AssetType -- Type of asset that as it appears in the Marketplace
	.viewportObject Accessory -- A 3D object to represent the item
	.creatorName string -- Name of the user or group that created the asset
	.creatorType Enum.CreatorType -- Type of the user/group that created the asset

	@within StandModule
]=]
export type ItemInfo = {
	assetId: number,
	title: string?,
	price: number?,
	description: string?,
	assetType: Enum.AssetType?,
	viewportObject: Accessory?,
	creatorName: string?,
	creatorType: Enum.CreatorType?,
	hiddenFromCatalog: boolean,
	isOwned: boolean?,
	productType: Enum.InfoType?,
	iconId: number?,
}

--[[
	A type that represents all the types of merch supported by the merch booth
]]
export type ProductType = Enum.AccessoryType | Enum.InfoType

return {}
