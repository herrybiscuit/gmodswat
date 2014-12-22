local ply = FindMetaTable("Player")

local teams = {}

teams[0] = {name = "S.W.A.T", color = Vector( 0, 0, 1.0 ), weapons = {"weapon_crowbar"} }
teams[1] = {name = "Terrorists", color = Vector( 1.0, 0, 0 ), weapons = {"weapon_crowbar"} }
--teams[2] = {name = "Spectators", color = Vector( 0.39, 0.39, 0.39 ), weapons = {} }

function ply:SetGamemodeTeam( n )
	if not teams[n] then return end
	
	self:SetTeam( n )
	
	self:SetPlayerColor( teams[n].color )
	
	self:GiveGamemodeWeapons()
	
	return true
end

function ply:GiveGamemodeWeapons()
	local n = self:Team()
	self:StripWeapons()
	
	for k, wep in pairs(teams[n].weapons) do
		self:Give(wep)
	end
end