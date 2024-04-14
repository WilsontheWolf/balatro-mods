--- STEAMODDED HEADER
--- MOD_NAME: Silly Seal
--- MOD_ID: sillyseal
--- MOD_AUTHOR: [WilsontheWolf]
--- MOD_DESCRIPTION: Testing the seal api
--- BADGE_COLOUR: FFFF00
----------------------------------------------
------------MOD CODE -------------------------


function SMODS.INIT.sillyseal()
    local loc_def = {
        ["name"] = "Silly Seal",
        ["text"] = {
            [1] = "I am totally a seal.",
            [2] = "{C:attention}Trust Me{}!"
        }
    }

    SMODS.Sprite:new("s_silly", SMODS.findModByID("sillyseal").path, "seal.png", 71, 95, "asset_atli"):register();

    -- function SMODS.Seal:new(name, label, full_name, pos, loc_txt, atlas, discovered, color)
    local seal_test = SMODS.Seal:new("Silly", "silly_seal", "Silly Seal", {x=0, y=0}, loc_def, "s_silly", true, HEX("FFFF00"))

    seal_test:register()
end

----------------------------------------------
------------MOD CODE END----------------------