local Store = {}
Store.__index = Store

function Store.new()
	local self = setmetatable({}, Store)

	self.data = {}

	return self
end

function Store:dispatch(assetObject)
	self.data[assetObject.assetId] = assetObject.itemInfo
end

return Store
