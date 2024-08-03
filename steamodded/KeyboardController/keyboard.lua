--- STEAMODDED HEADER
--- MOD_NAME: Keyboard Controller
--- MOD_ID: balatro_kbm
--- MOD_AUTHOR: [WilsontheWolf]
--- MOD_DESCRIPTION: Enables the hidden keyboard controller emulation.
--- PREFIX: balatro_kbm

if G.keybind_mapping[1] then
    G.keybind_mapping = G.keybind_mapping[1]
    _RELEASE_MODE = false -- The controller thing only works in debug mode
    function G.CONTROLLER.keyboard_controller.setVibration() end -- Compat for vibration enable mod
end

