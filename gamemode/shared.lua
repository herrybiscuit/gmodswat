GM.Name = "Gmod Swat"
GM.Author = "Herrybiscuit"
GM.Email = "N/A"
GM.Website = "N/A"

team.SetUp( 0, "SWAT", Color(0, 0, 255) )
team.SetUp( 1, "Terrorists", Color(255, 0, 0) )
team.SetUp( 2, "Spectators", Color(100, 100, 100) )

function GM:Initialize()
	self.BaseClass.Initialize( self )
end