return function(store: any)
	--[[
		A callback function that is triggered when a player is added to the game.
		
		Parameters:
		player: The player to send the proximityButtons to
	]]
	local function onPlayerAdded(player: Player, initialLoadData: RemoteEvent?)
		-- Send current store state to player
		local state = store:getState()
		
		local assetObjects = state.assetObjects
		local proximityButtons = state.proximityButtons
		
		-- Fire the initialLoadData event to the client with the proximityButtons and assetObjects
		initialLoadData:FireClient(player, assetObjects, proximityButtons)
		
		-- Conect to the function claimBooth
		for _, proximityButton in ipairs(proximityButtons) do
			proximityButton.Triggered:Connect(function(player)
				BoothModule.claimBooth(proximityButton, player)
			end)
		end
	end
	
	return onPlayerAdded
end
