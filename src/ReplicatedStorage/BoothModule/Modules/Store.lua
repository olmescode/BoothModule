local Store = {}
Store.__index = Store

function Store.new()
	local self = setmetatable({}, Store)

	self.assetObjects = {}
	self.proximityButtons = {}

	return self
end

--[[
	dispatch(assetObject)
	Adds an assetObject to the Store's assetObjects list.

	@param assetObject (table) - The asset object to be added.
]]
function Store:dispatch(assetObject)
	if typeof(assetObject) ~= "table" then
		error("AssetObject must be a table")
	end
	
	--self.assetObjects[assetObject.assetId] = assetObject.itemInfo
	table.insert(self.assetObjects, assetObject)
end

--[[
	dispatchProximityButton(proximityButton)
	Adds a proximityButton to the Store's proximityButtons list.

	@param proximityButton (userdata) - The proximity button to be added.
]]
function Store:dispatchProximityButton(proximityButton)
	if typeof(proximityButton) ~= "Instance" then
		error("ProximityButton must be a userdata")
	end
	table.insert(self.proximityButtons, proximityButton)
end

--[[
	getState()
	Returns the Store's data list.
	
	@returns (table) - The list of all asset objects and proximityButtons.
]]
function Store:getState()
	return self
end

return Store
