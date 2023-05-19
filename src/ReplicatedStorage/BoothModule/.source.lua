print("Required BoothModule")
local addItemAsync = require(script.Api.addItemAsync)
local getItems = require(script.Api.getItems)
local claimBooth = require(script.Actions.claimBooth)
local addProximityButton = require(script.Api.addProximityButton)
local onPlayerAdded = require(script.Components.onPlayerAdded)
local setEnabled = require(script.Api.setEnabled)
local serverStore = require(script.Modules.serverStore)
local clientStore = require(script.Modules.clientStore)

local BoothModule = {
	-- Configurations
	
	-- Functions
	claimBooth = claimBooth,
	onPlayerEntered = onPlayerAdded(serverStore),
	
	-- Server APIs
	addItemAsync = addItemAsync(serverStore),
	addProximityButton = addProximityButton(serverStore),
	
	-- Client APIs
	setEnabled = setEnabled(clientStore),
	
	-- Server and client APIs
	getItems = getItems(serverStore, clientStore),
	
	-- Remotes
	remotes = script.Remotes
	
}

return BoothModule
