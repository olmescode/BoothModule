print("Required BoothModule")
local addItemAsync = require(script.Api.addItemAsync)
local getItems = require(script.Api.getItems)
local addProximityButton = require(script.Api.addProximityButton)
local onPlayerAdded = require(script.Components.onPlayerAdded)
local setEnabled = require(script.Api.setEnabled)
local serverStore = require(script.Modules.serverStore)

local BoothModule = {
	-- Configurations
	
	-- Functions
	onPlayerEntered = onPlayerAdded(serverStore),
	setEnabled = setEnabled(serverStore),
	
	-- Server APIs
	addItemAsync = addItemAsync(serverStore),
	addProximityButton = addProximityButton(serverStore),
	
	-- Client APIs
	
	-- Server and client APIs
	getItems = getItems(serverStore),
	
	-- Remotes
	remotes = script.Remotes
	
}

return BoothModule
