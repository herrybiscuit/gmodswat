DeriveGamemode("base")

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")
include("player.lua")

function GM:PlayerInitialSpawn( ply )
	--ply:SetGamemodeTeam( 2 )
	GM:PlayerSpawnAsSpectator(ply)
end

--Load modules
local fol = GM.FolderName.."/gamemode/modules/" --Set base dir
local files, folders = file.Find(fol .. "*", "LUA") --Get all module files

for _,folder in SortedPairs(folders, true) do
	if folder == "." or folder == ".." then continue end --If no files then stop
	
	for _, File in SortedPairs(file.Find(fol .. folder .."/sh_*.lua", "LUA"), true) do
		AddCSLuaFile(fol..folder .. "/" ..File)
		include(fol.. folder .. "/" ..File)
	end
	
	--Load module server files
	for _, File in SortedPairs(file.Find(fol .. folder .."/sv_*.lua", "LUA"), true) do --Get server files
		include(fol.. folder .. "/" ..File) --Include module's server lua files
	end
	
	for _, File in SortedPairs(file.Find(fol .. folder .."/cl_*.lua", "LUA"), true) do
		if File == "cl_interface.lua" then continue end
		AddCSLuaFile(fol.. folder .. "/" ..File)
	end
end