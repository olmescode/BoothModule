return function(store: any)
	--[[
		A callback function that is triggered when a player is added to the game.
		
		Parameters:
		player: The player to send the proximityButtons to
	]]
	local function onPlayerAdded(player: Player, initialLoadData: RemoteEvent?)
		-- Get all proximityButtons from ServerStore
		local state = store:getState()

		-- Fire the initialLoadData event to the client with the proximityButtons data
		initialLoadData:FireClient(player, state.proximityButtons)
	end
	
	return onPlayerAdded
end
