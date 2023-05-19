local BoothModule = script:FindFirstAncestor("BoothModule")

local boothClaim = BoothModule.Remotes.BoothClaim :: RemoteEvent

local function claimBooth(claimedButton, player)
	local standModel = claimedButton:FindFirstAncestorWhichIsA("Part")
	
	-- Check if the booth is already claimed
	if standModel:GetAttribute("Claimed") then
		return
	end

	-- Create a "Claimed" and "Owner" attribute for the booth model
	standModel:SetAttribute("Claimed", true)
	standModel:SetAttribute("Owner", player.UserId)
	
	-- Disable the prompt
	claimedButton.Enabled = false
	
	-- Send a claim request to the client
	boothClaim:FireClient(player)
end

return claimBooth
