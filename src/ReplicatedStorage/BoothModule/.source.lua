print("Required BoothModule")
local addItemAsync = require(script.Api.addItemAsync)
local getItems = require(script.Api.getItems)
local addProximityButton = require(script.Api.addProximityButton)
local serverStore = require(script.Modules.serverStore)

local BoothModule = {
	-- Configurations
	
	-- Functions
	onBoothClaim = require(script.Api.onBoothClaim),
	claimBooth = require(script.Api.claimBooth),
	
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
