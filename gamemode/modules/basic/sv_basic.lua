function GM:CanPlayerSuicide( ply )
	if ply:IsAdmin() then
		ply:PrintMessage(HUD_PRINTTALK, "You killed your self!")
		return true
	end
	ply:PrintMessage(HUD_PRINTTALK, "You can't suicide!")
	return false 
end

local function DisableNoclip( ply )
	return ply:IsAdmin() or ply:Team() == 2
end