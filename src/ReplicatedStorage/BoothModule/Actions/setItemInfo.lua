local BoothModule = script:FindFirstAncestor("BoothModule")

local types = require(BoothModule.types)

export type Action = {
	itemId: string,
	info: types.ItemInfo,
}

-- Returns a table containing two key-value pairs
local function setItemInfo(itemId: string, info: types.ItemInfo)
	return {
		[itemId] = info
	}
end

return setItemInfo
