Script.Load("lua/FastJoin/FastJoin.lua")

local fastJoinHooked = ModLoader.SetupFileHook( "lua/menu/GUIMainMenu.lua", "lua/FastJoin/FastJoin_GUIMainMenuHooks.lua", "post" )

if not fastJoinHooked then
    FastJoin.message("Failed to hook!")
end
