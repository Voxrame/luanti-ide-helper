

--- @class LBMDefinition
local LBMDefinition = {
    --- Descriptive label for profiling purposes (optional).
    --- Definitions with identical labels will be listed as one.
	--- @type string
    label = "Upgrade legacy doors",

    --- Identifier of the LBM, should follow the modname:<whatever> convention
	--- @type string
    name = "modname:replace_legacy_door",

    --- - List of node names to trigger the LBM on.
    --- - Names of non-registered nodes and groups (as group:groupname) will work as well.
	--- @type string[]
    nodenames = {"default:lava_source"},

    --- If `false`: The LBM only runs on mapblocks the first time they are
    --- activated after the LBM was introduced.
    --- It never runs on mapblocks generated after the LBM's introduction.
    --- See above for details: https://api.luanti.org/definition-tables/#lbm-loadingblockmodifier-definition
    ---
    --- If `true`: The LBM runs every time a mapblock is activated.
	--- @type boolean?
    run_at_every_load = false,

    --- Function triggered for each qualifying node.
    --- `dtime` is the in-game time (in seconds) elapsed since the mapblock
    --- was last active (available since 5.7.0).
	--- @type fun(pos:Position, node:NodeTable, dtime:number)?
    action = function(pos, node, dtime) end,

    --- Function triggered with a list of all applicable node positions at once.
    --- - This can be provided as an alternative to `action` (not both).
    --- - Available since `core.features.bulk_lbms` (5.10.0)
    --- - `dtime` is the in-game time (in seconds) elapsed since the mapblock
    --- was last active (available since 5.7.0).
	--- @type fun(pos_list:Position[], dtime:number)?
    bulk_action = function(pos_list, dtime) end,
}
