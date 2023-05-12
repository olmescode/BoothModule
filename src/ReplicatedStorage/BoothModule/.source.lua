print("Required StandModule")
local addItemAsync = require(script.Api.addItemAsync)
local serverStore = require(script.Modules.serverStore)

local BoothModule = {
	-- Configurations
	
	-- Functions
	
	-- Server APIs
	addItemAsync = addItemAsync(serverStore),
	onBoothClaim = require(script.Api.onBoothClaim),
	
	-- Client APIs
	claimBooth = require(script.Api.claimBooth),
	
	-- Server and client APIs
	
	remotes = script.Remotes
	
}

return BoothModule
