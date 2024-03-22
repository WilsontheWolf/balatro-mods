--- STEAMODDED HEADER
--- MOD_NAME: Crashing
--- MOD_ID: Crashing
--- MOD_AUTHOR: [WilsontheWolf]
--- MOD_DESCRIPTION: Press "[" to Crash

----------------------------------------------
------------MOD CODE -------------------------

function SMODS.INIT.Crashing()
    
end

local keyHandler = Controller.key_press_update;
function Controller:key_press_update(key, dt)
	if(key == '[') then error('Funny Crash go BRRRRRRRRRRR') end
	return keyHandler(self, key, dt)
end

----------------------------------------------
------------MOD CODE END----------------------
