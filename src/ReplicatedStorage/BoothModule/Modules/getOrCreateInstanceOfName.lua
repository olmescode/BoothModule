--[[
	Returns the existing instance of the specified `instanceType` with name
	`instanceName` that is a child of 'parent', otherwise that instance to
	return.
	
	This function is called when creating or obtaining the instance for the
	AvatarScreenGui or AssetsFolder used for MerchBooth.
]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")

--[[
	Gets (or creates) an instance by name.

	This is used to generate [Folder]s and other instances on the fly.

	```lua
		local foo = getOrCreateInstanceOfName("Foo", "Folder")
		print(foo:GetFullName()) -- game.ReplicatedStorage.Foo
	```

	@within Modules
]]
local function getOrCreateInstanceOfName(instanceName: string, instanceType: string, parent: Instance?): Instance
	if not instanceName or not instanceType then
		return nil
	elseif not parent then
		parent = ReplicatedStorage
	end

	local instance = parent:FindFirstChild(instanceName)
	if not instance then
		instance = Instance.new(instanceType)
		instance.Name = instanceName
		instance.Parent = parent
	end

	return instance
end

return getOrCreateInstanceOfName
