--[[
	Matches the numeric value of an [AccessoryType] to its equivalent enum (as a
	string).

	```lua
	matchIdToType(42) -- "FaceAccessory"
	```

	This function is called during the initial setup for MerchBooth accessories;
	the returned string is used to set the AccessoryType attribute of the
	accessory.

	@within Modules
	@return string The string conversion of the [AssetType] whose Value matches the `assetTypeId`.
]]

local function matchIdToType(assetTypeId: number): Enum.AssetType?
	for _, assetType in ipairs(Enum.AssetType:GetEnumItems()) do
		if assetType.Value == assetTypeId then
			return assetType
		end
	end
	return nil
end

return matchIdToType
