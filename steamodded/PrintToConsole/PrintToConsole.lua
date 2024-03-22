--- STEAMODDED HEADER
--- MOD_NAME: Print To Console
--- MOD_ID: PrintToConsole
--- MOD_AUTHOR: [WilsontheWolf]
--- MOD_DESCRIPTION: Print sendDebugMessage to the console as well.

----------------------------------------------
------------MOD CODE -------------------------

function SMODS.INIT.PrintToConsole()
    
end

local origSendDebugMessage = sendDebugMessage
function sendDebugMessage(message)
	print(message)
	origSendDebugMessage(message)
end
----------------------------------------------
------------MOD CODE END----------------------
