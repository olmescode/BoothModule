local RunService = game:GetService("RunService")

local MerchBooth = script:FindFirstAncestor("MerchBooth")

return function(store: any)
	--[=[
		Adds a button over the given adornee that will trigger the display of an
		item's purchase view, given its asset ID.

		This can be used as an alternative to the 2D "catalog view" to let
		players discover items through the 3D environment instead.

		This function must be used in conjunction with [MerchBooth.addItemAsync].
		An item must be registered before a proximity button can be assigned to it.

		```lua
		local ReplicatedStorage = game:GetService("ReplicatedStorage")

		local MerchBooth = require(ReplicatedStorage:WaitForChild("MerchBooth"))

		MerchBooth.addItemAsync(4794106130)
		MerchBooth.addProximityButton(workspace.Item, 4794106130)
		```

		@within MerchBooth
		@server
	]=]
	local function addProximityButton(proximityButton)
		assert(RunService:IsServer(), "MerchBooth.addProximityButton must be called on the server")

		store:dispatchProximityButton(proximityButton)
	end

	return addProximityButton
end
