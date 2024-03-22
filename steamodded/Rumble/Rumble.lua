--- STEAMODDED HEADER
--- MOD_NAME: Rumble
--- MOD_ID: Rumble
--- MOD_AUTHOR: [WilsontheWolf]
--- MOD_DESCRIPTION: Enables controller rumble support

----------------------------------------------
------------MOD CODE -------------------------

function SMODS.INIT.Rumble()
    sendDebugMessage("Rumble Activated!")
    G.F_RUMBLE = 1.0
end

----------------------------------------------
------------MOD CODE END----------------------
