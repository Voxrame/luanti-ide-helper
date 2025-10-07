local mod_path = core.get_modpath(core.get_current_modname())

-- This is just a dummy file in case if someone actually installs this mod.

minetest.log(
    'warning',
    'Mod `luanti-ide-helper` is not a mod as such. It should not be installed. ' ..
        'For development usage install it as a git submodule outside of `./mods/ folder. ' ..
        'For details see `' .. mod_path .. '/readme.md`'
)
