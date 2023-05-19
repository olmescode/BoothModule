local RunService = game:GetService("RunService")

return function(store: any)
	--[=[
		This function must be used in conjunction with [BoothModule.addItemAsync].
		An item must be registered before a proximity button can be assigned to it.

		```lua
		local ReplicatedStorage = game:GetService("ReplicatedStorage")

		local BoothModule = require(ReplicatedStorage:WaitForChild("BoothModule"))

		BoothModule.addItemAsync(4794106130)
		BoothModule.addProximityButton(workspace.Item, 4794106130)
		```

		@within BoothModule
		@server
	]=]
	local function addProximityButton(proximityButton)
		assert(RunService:IsServer(), "BoothModule.addProximityButton must be called on the server")
		
		store:dispatchProximityButton(proximityButton)
	end

	return addProximityButton
end
