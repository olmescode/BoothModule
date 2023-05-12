local BoothModule = script:FindFirstAncestor("BoothModule")
local remotes = BoothModule.Remotes

local function onBoothClaim(player, prompt)
	local standModel = prompt:FindFirstAncestorWhichIsA("Part")
	
	-- Check if the booth is already claimed
	if standModel:GetAttribute("Claimed") then
		return
	end

	-- Create a Claimed and Owner attribute for stand model
	standModel:SetAttribute("Claimed", true)
	standModel:SetAttribute("Owner", player.UserId)
	
	-- Disable the prompt
	prompt.Enabled = false
	
end

return onBoothClaim
