return function(store: any)
	--[=[
		Gets all of the items registered with the Booth Shop.

		The returned dictionary's keys are the asset IDs of each item as
		strings, and the values are objects.

		Usage:

		```lua
		local ReplicatedStorage = game:GetService("ReplicatedStorage")

		local MerchBooth = require(ReplicatedStorage:WaitForChild("BoothModule"))

		MerchBooth.addItemAsync(4794106130)
		local items = MerchBooth.getItems()
		print(items)
		```

		The result of `print(items)` is:

		```lua
		{
			["4794106130"] =  ▼  {
				["assetId"] = 4794106130,
				["assetType"] = Enum.AssetType.BackAccessory,
				["creatorName"] = "Yourius",
				["creatorType"] = User,
				["description"] = "You might as well just call it a backuette at this point.",
				["price"] = 100
			}
		}
		```

		@within BoothModule
		@server
		@client
	]=]
	local function getItems()
		return store:getState()
	end

	return getItems
end
