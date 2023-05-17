local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local BoothModule = require(ReplicatedStorage:WaitForChild("BoothModule"))

local initialLoadData = BoothModule.Remotes.InitialLoadData :: RemoteEvent

local function onPlayerEntered(player: Player)
	-- Send current store state to player
	local state = BoothModule.getItems()

	-- ProximityButtons table needs to be converted from a dict to a list of tuples because keys get automatically
	local proximityButtons = {}
	for adornee, id in pairs(state.proximityButtons) do
		table.insert(proximityButtons)
	end

	initialLoadData:FireClient(player, proximityButtons)
end

Players.PlayerAdded:Connect(onPlayerEntered)
