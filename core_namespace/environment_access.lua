--- @meta

-- ---------------------
-- # Environment access:
-- ---------------------


--- @param pos  MapPosition
--- @param node NodeTable
function core.set_node(pos, node) end

--- Alias to `core.set_node`
--- * Set node at position `pos`
--- * `node`: table `{name=string, param1=number, param2=number}`
--- * If param1 or param2 is omitted, it's set to `0`.
--- * e.g. `core.set_node({x=0, y=10, z=0}, {name="default:wood"})`
---
--- @param pos  MapPosition
--- @param node NodeTable
function core.add_node(pos, node) end

--- * Set node on all positions set in the first argument.
--- * e.g. `core.bulk_set_node({{x=0, y=1, z=1}, {x=1, y=2, z=2}}, {name="default:stone"})`
--- * For node specification or position syntax see `core.set_node` call
--- * Faster than set_node due to single call, but still considerably slower
---   than Lua Voxel Manipulators (LVM) for large numbers of nodes.
---   Unlike LVMs, this will call node callbacks. It also allows setting nodes
---   in spread out positions which would cause LVMs to waste memory.
---   For setting a cube, this is 1.3x faster than set_node whereas LVM is 20
---   times faster.
---
---
--- @param positions MapPosition[] {pos1, pos2, pos3, ...}
--- @param node      NodeTable
function core.bulk_set_node(positions, node) end

--- Swap node at position with another.
--- * This keeps the metadata intact and will not run con-/destructor callbacks.
---
---
--- @param pos  MapPosition
--- @param node NodeTable
function core.swap_node(pos, node) end

--- Equivalent to core.set_node(pos, {name="air"}), but a bit faster.
--- (Any existing metadata is deleted.)
---
--- @param pos MapPosition
function core.remove_node(pos) end

--- * Returns the node at the given position as table in the format
---   `{name="node_name", param1=0, param2=0}`,
---   returns `{name="ignore", param1=0, param2=0}` for unloaded areas.
---
---@param pos MapPosition
---@return NodeTable
function core.get_node(pos) end

--- * Same as `get_node` but returns `nil` for unloaded areas.
---
--- @param pos MapPosition
--- @return NodeTable|nil
function core.get_node_or_nil(pos) end

--- * Gets the light value at the given position. Note that the light value
---   "inside" the node at the given position is returned, so you usually want
---   to get the light value of a neighbor.
--- * Returns a number between `0` and `15` or `nil`
--- * `nil` is returned e.g. when the map isn't loaded at `pos`
---
--- @param pos       MapPosition The position where to measure the light.
--- @param timeofday number|nil  `nil` for current time, `0` for night, `0.5` for day
--- @return number|nil
function core.get_node_light(pos, timeofday) end

--- * Figures out the sunlight (or moonlight) value at pos at the given time of
---   day.
--- * `pos`: The position of the node
--- * `timeofday`: [Optional] `nil` for current time, `0` for night, `0.5` for day
--- * Returns a number between `0` and `15` or `nil`
--- * This function tests 203 nodes in the worst case, which happens very
---   unlikely
---
--- @param pos       MapPosition The position where to measure the light.
--- @param timeofday number|nil  `nil` for current time, `0` for night, `0.5` for day
function core.get_natural_light(pos, timeofday) end

--- * Calculates the artificial light (light from e.g. torches) value from the
---   `param1` value.
--- * `param1`: The param1 value of a `paramtype = "light"` node.
--- * Returns a number between `0` and `15`
--- * Currently it's the same as `math.floor(param1 / 16)`, except that it
---   ensures compatibility.
---
function core.get_artificial_light(param1) end

--- * Place node with the same effects that a player would cause
---
--- @param pos  MapPosition
--- @param node NodeTable
function core.place_node(pos, node) end

--- * Dig node with the same effects that a player would cause
--- * Returns `true` if successful, `false` on failure (e.g. protected location)
---
--- @param pos  MapPosition
function core.dig_node(pos) end

--- * Punch node with the same effects that a player would cause
---
--- @param pos  MapPosition
function core.punch_node(pos) end

--- * Change node into falling node
--- * Returns `true` if successful, `false` on failure
---
--- @param pos  MapPosition
function core.spawn_falling_node(pos) end

--- * Get a table of positions of nodes that have metadata within a region
---   {pos1, pos2}.
---
--- @param pos1 MapPosition
--- @param pos2 MapPosition
function core.find_nodes_with_meta(pos1, pos2) end

--- * Get a `NodeMetaRef` at that position
---
--- @param pos MapPosition
--- @return NodeMetaRef
function core.get_meta(pos) end

--- * Get `NodeTimerRef`
---
--- @param pos MapPosition
--- @return NodeTimerRef
function core.get_node_timer(pos) end

--- Spawn Lua-defined entity at
---   position.
--- * Returns `ObjectRef`, or `nil` if failed
---
--- `staticdata` [Optional] no info
--- @param pos        Position
--- @param name       string
--- @param staticdata string?
--- @return ObjectRef|Entity|nil
function core.add_entity(pos, name, staticdata) end

--- Spawn item
--- * Returns `ObjectRef`, or `nil` if failed
---
--- @param pos   Position
--- @return ObjectRef|nil
function core.add_item(pos, item) end

--- Get an `ObjectRef` to a player
---
--- @param name string
--- @return Player|nil
function core.get_player_by_name(name) end

--- Returns a list of
---   ObjectRefs.
--- * `radius`: using an euclidean metric
---
--- @param pos Position
--- @param radius number
--- @return ObjectRef[]|Entity[]|Player[]
function core.get_objects_inside_radius(pos, radius) end

--- Returns a list of
---   ObjectRefs.
---  * `pos1` and `pos2` are the min and max positions of the area to search.
---
--- @param pos1 Position
--- @param pos2 Position
--- @return ObjectRef[]|Entity[]|Player[]
function core.get_objects_in_area(pos1, pos2) end

--- * `val` is between `0` and `1`; `0` for midnight, `0.5` for midday
---
---@param val number
function core.set_timeofday(val) end

---@return number
function core.get_timeofday() end

--- Returns the time, in seconds, since the world was
---   created.
---
function core.get_gametime() end

--- Returns number days elapsed since world was
---   created.
--- * accounts for time changes.
---
function core.get_day_count() end

--- Returns pos or `nil`.
---
---
--- @param pos              MapPosition
--- @param radius           number       using a maximum metric
--- @param node_names       table|string e.g. `{"ignore", "group:tree"}` or `"default:dirt"`
--- @param search_in_center boolean      Optional. If true `pos` is also checked for the nodes. (default: `false`).
---
--- @return Position|nil
function core.find_node_near(pos, radius, node_names, search_in_center) end

--- * If `grouped` is true the return value is a table indexed by node name
---   which contains lists of positions.
--- * If `grouped` is false or absent the return values are as follows:
---   first value: Table with all node positions
---   second value: Table with the count of each node with the node name as index
--- * Area volume is limited to 4,096,000 or 150,000,000 nodes (depending on the version)
---
---
--- @param pos1       MapPosition  min positions of the area to search.
--- @param pos2       MapPosition  max positions of the area to search.
--- @param node_names table|string e.g. `{"ignore", "group:tree"}` or `"default:dirt"`
--- @param grouped    boolean?     [optional] If true the return value is a table indexed by node name which contains lists of positions. (default: `false`).
---
--- @return (table<string,Position[]>|Position[]), (nil|table<string,number>)
function core.find_nodes_in_area(pos1, pos2, node_names, grouped) end

--- Returns a
---   list of positions.
--- * `nodenames`: e.g. `{"ignore", "group:tree"}` or `"default:dirt"`
--- * Return value: Table with all node positions with a node air above
--- * Area volume is limited to 4,096,000 nodes
---
--- @param pos1       MapPosition  min positions of the area to search.
--- @param pos2       MapPosition  max positions of the area to search.
--- @param node_names table|string e.g. `{"ignore", "group:tree"}` or `"default:dirt"`
function core.find_nodes_in_area_under_air(pos1, pos2, node_names) end

--- * Deprecated: renamed to `core.get_value_noise` in version 5.12.0.
--- @deprecated
--- @param  noiseparams NoiseParams
--- @return ValueNoise
function core.get_perlin(noiseparams) end

--- * Deprecated: renamed to core.get_value_noise in version 5.12.0.
--- @deprecated
--- @return ValueNoise
function core.get_perlin(seeddiff, octaves, persistence, spread) end

--- * Return world-specific value noise.
--- * The actual seed used is the noiseparams seed plus the world seed.
--- * **Important**: Requires the mapgen environment to be initalized, do not use at load time.
--- @param  noiseparams NoiseParams
--- @return ValueNoise
function core.get_value_noise(noiseparams) end

--- * Deprecated: use `core.get_value_noise(noiseparams)` instead.
--- @deprecated
--- @return ValueNoise
function core.get_value_noise(seeddiff, octaves, persistence, spread) end

--- * Return voxel manipulator object.
--- * Loads the manipulator from the map if positions are passed.
---
--- @param min_position MapPosition? min position
--- @param max_position MapPosition? max position
--- @return VoxelManip
function core.get_voxel_manip(min_position, max_position) end

--- * Set the types of on-generate notifications that should be collected.
--- * `flags` is a flag field with the available flags:
---     * dungeon
---     * temple
---     * cave_begin
---     * cave_end
---     * large_cave_begin
---     * large_cave_end
---     * decoration
---
--- @param flags      string flagstring with any of the above flags separated by commas.
--- @param deco_ids   table? list of decoration IDs which notification is requested for.
--- @param custom_ids table? list of user-defined IDs (strings) which are requested.
---                          By convention these should be the mod name with an optional
---                          colon and specifier added, e.g. `"default"` or `"default:dungeon_loot"`
function core.set_gen_notify(flags, deco_ids, custom_ids) end

--- * Returns a flagstring and a table with the `deco_id`s.
---
function core.get_gen_notify() end

--- * Returns the decoration ID number for the provided decoration name string,
---   or `nil` on failure.
---
function core.get_decoration_id(decoration_name) end

--- * `voxelmanip` - VoxelManip object
--- * `heightmap` - 2D array of height values (y)
--- * `biomemap` - 2D array of biome IDs
--- * `heatmap` - 2D array of heat values (0-255)
--- * `humiditymap` - 2D array of humidity values (0-255)
--- * `gennotify` - Table of on-generate notifications (see `core.set_gen_notify`)
--- @alias MapgenObjectName
--- | "voxelmanip" # VoxelManip object
--- | "heightmap" # 2D? array of height values (y)
--- | "biomemap" # 2D? array of biome IDs
--- | "heatmap" # 2D? array of heat values (0-255)
--- | "humiditymap" # 2D? array of humidity values (0-255)
--- | "gennotify" # Table of on-generate notifications (see `core.set_gen_notify`)

--- Returns requested mapgen object if available (see [Mapgen objects])
---
--- @overload fun(objectname:"voxelmanip") :VoxelManip, Position, Position
--- @overload fun(objectname:"heightmap")  :number[][]
--- @overload fun(objectname:"biomemap")   :number[][]
--- @overload fun(objectname:"heatmap")    :number[][]
--- @overload fun(objectname:"humiditymap"):number[][]
--- @overload fun(objectname:"gennotify")  :table
--- @param objectname MapgenObjectName one of: "voxelmanip", "heightmap", "biomemap", "heatmap", "humiditymap", "gennotify"
--- @return VoxelManip|number[][]|number[][][], Position, Position
function core.get_mapgen_object(objectname) end

--- * Returns the heat at the position, or `nil` on failure.
---
--- @param pos MapPosition
function core.get_heat(pos) end

--- * Returns the humidity at the position, or `nil` on failure.
---
--- @param pos MapPosition
function core.get_humidity(pos) end

--- * Returns a table containing:
---     * `biome` the biome id of the biome at that position
---     * `heat` the heat at the position
---     * `humidity` the humidity at the position
--- * Or returns `nil` on failure.
---
--- @param pos MapPosition
function core.get_biome_data(pos) end

--- * Returns the biome id, as used in the biomemap Mapgen object and returned
---   by `core.get_biome_data(pos)`, for a given biome_name string.
---
function core.get_biome_id(biome_name) end

--- * Returns the biome name string for the provided biome id, or `nil` on
---   failure.
--- * If no biomes have been registered, such as in mgv6, returns `default`.
---
function core.get_biome_name(biome_id) end

--- * Deprecated: use `core.get_mapgen_setting(name)` instead.
--- * Returns a table containing:
---     * `mgname`
---     * `seed`
---     * `chunksize`
---     * `water_level`
---     * `flags`
---
function core.get_mapgen_params() end

--- * Deprecated: use `core.set_mapgen_setting(name, value, override)`
---   instead.
--- * Set map generation parameters.
--- * Function cannot be called after the registration period; only
---   initialization and `on_mapgen_init`.
--- * Takes a table as an argument with the fields:
---     * `mgname`
---     * `seed`
---     * `chunksize`
---     * `water_level`
---     * `flags`
--- * Leave field unset to leave that parameter unchanged.
--- * `flags` contains a comma-delimited string of flags to set, or if the
---   prefix `"no"` is attached, clears instead.
--- * `flags` is in the same format and has the same options as `mg_flags` in
---   `minetest.conf`.
---
function core.set_mapgen_params(MapgenParams) end

--- * Gets the *active* mapgen setting (or nil if none exists) in string
---   format with the following order of precedence:
---     1) Settings loaded from map_meta.txt or overrides set during mod
---        execution.
---     2) Settings set by mods without a metafile override
---     3) Settings explicitly set in the user config file, minetest.conf
---     4) Settings set as the user config default
---
--- @return string|nil
function core.get_mapgen_setting(name) end

--- * Same as above, but returns the value as a NoiseParams table if the
---   setting `name` exists and is a valid NoiseParams.
---
function core.get_mapgen_setting_noiseparams(name) end

--- * Sets a mapgen param to `value`, and will take effect if the corresponding
---   mapgen setting is not already present in map_meta.txt.
--- * `override_meta` [Optional] is an optional boolean (default: `false`). If this is set
---   to true, the setting will become the active setting regardless of the map
---   metafile contents.
--- * Note: to set the seed, use `"seed"`, not `"fixed_map_seed"`.
---
function core.set_mapgen_setting(name, value, override_meta) end

--- * Same as above, except value is a NoiseParams table.
---
function core.set_mapgen_setting_noiseparams(name, value, override_meta) end

--- * Sets the noiseparams setting of `name` to the noiseparams table specified
---   in `noiseparams`.
--- * `set_default` is an optional boolean (default: `true`) that specifies
---   whether the setting should be applied to the default config or current
---   active config.
---
function core.set_noiseparams(name, noiseparams, set_default) end

--- * Returns a table of the noiseparams for name.
---
function core.get_noiseparams(name) end

--- * Generate all registered ores within the VoxelManip `vm` and in the area
---   from `pos1` to `pos2`.
--- * `pos1` and `pos2` are optional and default to mapchunk minp and maxp.
---
--- @param vm   VoxelManip
--- @param pos1 MapPosition
--- @param pos2 MapPosition
function core.generate_ores(vm, pos1, pos2) end

--- * Generate all registered decorations within the VoxelManip `vm` and in the
---   area from `pos1` to `pos2`.
--- * `pos1` and `pos2` are optional and default to mapchunk minp and maxp.
---
--- @param vm   VoxelManip
--- @param pos1 MapPosition
--- @param pos2 MapPosition
function core.generate_decorations(vm, pos1, pos2) end

--- * Clear all objects in the environment
--- * Takes an optional table as an argument with the field `mode`.
---     * mode = `"full"` : Load and go through every mapblock, clearing
---                         objects (default).
---     * mode = `"quick"`: Clear objects immediately in loaded mapblocks,
---                         clear objects in unloaded mapblocks only when the
---                         mapblocks are next activated.
---
function core.clear_objects(options) end

--- * Load the mapblocks containing the area from `pos1` to `pos2`.
---   `pos2` defaults to `pos1` if not specified.
--- * This function does not trigger map generation.
---
--- @param pos1 MapPosition
--- @param pos2 MapPosition
function core.load_area(pos1, pos2) end

--- * Queue all blocks in the area from `pos1` to `pos2`, inclusive, to be
---   asynchronously fetched from memory, loaded from disk, or if inexistent,
---   generates them.
--- * If `callback` is a valid Lua function, this will be called for each block
---   emerged.
--- * The function signature of callback is:
---   `function EmergeAreaCallback(blockpos, action, calls_remaining, param)`
---     * `blockpos` is the *block* coordinates of the block that had been
---       emerged.
---     * `action` could be one of the following constant values:
---         * `core.EMERGE_CANCELLED`
---         * `core.EMERGE_ERRORED`
---         * `core.EMERGE_FROM_MEMORY`
---         * `core.EMERGE_FROM_DISK`
---         * `core.EMERGE_GENERATED`
---     * `calls_remaining` is the number of callbacks to be expected after
---       this one.
---     * `param` is the user-defined parameter passed to emerge_area (or
---       nil if the parameter was absent).
---
--- @param pos1 MapPosition
--- @param pos2 MapPosition
function core.emerge_area(pos1, pos2, callback, param) end

--- * delete all mapblocks in the area from pos1 to pos2, inclusive
---
--- @param pos1 MapPosition
--- @param pos2 MapPosition
function core.delete_area(pos1, pos2) end

--- Returns `boolean, pos`
--- * Checks if there is anything other than air between pos1 and pos2.
--- * Returns false if something is blocking the sight.
--- * Returns the position of the blocking node when `false`
--- * `pos1`: First position
--- * `pos2`: Second position
---
--- @param pos1 MapPosition
--- @param pos2 MapPosition
function core.line_of_sight(pos1, pos2) end

--- Returns `Raycast`
--- * Creates a `Raycast` object.
--- * `pos1`: start of the ray
--- * `pos2`: end of the ray
--- * `objects`: if false, only nodes will be returned. Default is `true`.
--- * `liquids`: if false, liquid nodes won't be returned. Default is `false`.
---
--- @param pos1    MapPosition
--- @param pos2    MapPosition
--- @param objects boolean?
--- @param liquids boolean?
function core.raycast(pos1, pos2, objects, liquids) end

--- * returns table containing path that can be walked on
--- * returns a table of 3D points representing a path from `pos1` to `pos2` or
---   `nil` on failure.
--- * Reasons for failure:
---     * No path exists at all
---     * No path exists within `searchdistance` (see below)
---     * Start or end pos is buried in land
--- * `pos1`: start position
--- * `pos2`: end position
--- * `searchdistance`: maximum distance from the search positions to search in.
---   In detail: Path must be completely inside a cuboid. The minimum
---   `searchdistance` of 1 will confine search between `pos1` and `pos2`.
---   Larger values will increase the size of this cuboid in all directions
--- * `max_jump`: maximum height difference to consider walkable
--- * `max_drop`: maximum height difference to consider droppable
--- * `algorithm`: One of `"A*_noprefetch"` (default), `"A*"`, `"Dijkstra"`.
---   Difference between `"A*"` and `"A*_noprefetch"` is that
---   `"A*"` will pre-calculate the cost-data, the other will calculate it
---   on-the-fly
---
--- @param pos1 MapPosition
--- @param pos2 MapPosition
function core.find_path(pos1,pos2,searchdistance,max_jump,max_drop,algorithm) end

--- * spawns L-system tree at given `pos` with definition in `treedef` table
---
--- @param pos MapPosition
function core.spawn_tree (pos, treedef) end

--- * add node to liquid update queue
---
--- @param pos MapPosition
function core.transforming_liquid_add(pos) end

--- * get max available level for leveled node
---
--- @param pos MapPosition
function core.get_node_max_level(pos) end

--- * get level of leveled node (water, snow)
---
--- @param pos MapPosition
function core.get_node_level(pos) end

--- * set level of leveled node, default `level` equals `1`
--- * if `totallevel > maxlevel`, returns rest (`total-max`).
---
--- @param pos MapPosition
function core.set_node_level(pos, level) end

--- * increase level of leveled node by level, default `level` equals `1`
--- * if `totallevel > maxlevel`, returns rest (`total-max`)
--- * `level` must be between -127 and 127
---
--- @param pos MapPosition
function core.add_node_level(pos, level) end

--- Returns `true`/`false`
--- * resets the light in a cuboid-shaped part of
---   the map and removes lighting bugs.
--- * Loads the area if it is not loaded.
--- * `pos1` is the corner of the cuboid with the least coordinates
---   (in node coordinates), inclusive.
--- * `pos2` is the opposite corner of the cuboid, inclusive.
--- * The actual updated cuboid might be larger than the specified one,
---   because only whole map blocks can be updated.
---   The actual updated area consists of those map blocks that intersect
---   with the given cuboid.
--- * However, the neighborhood of the updated area might change
---   as well, as light can spread out of the cuboid, also light
---   might be removed.
--- * returns `false` if the area is not fully generated,
---   `true` otherwise
---
--- @param pos1 MapPosition
--- @param pos2 MapPosition
function core.fix_light(pos1, pos2) end

--- * causes an unsupported `group:falling_node` node to fall and causes an
---   unattached `group:attached_node` node to fall.
--- * does not spread these updates to neighbours.
---
--- @param pos MapPosition
function core.check_single_for_falling(pos) end

--- * causes an unsupported `group:falling_node` node to fall and causes an
---   unattached `group:attached_node` node to fall.
--- * spread these updates to neighbours and can cause a cascade
---   of nodes to fall.
---
--- @param pos MapPosition
function core.check_for_falling(pos) end

--- * Returns a player spawn y co-ordinate for the provided (x, z)
---   co-ordinates, or `nil` for an unsuitable spawn point.
--- * For most mapgens a 'suitable spawn point' is one with y between
---   `water_level` and `water_level + 16`, and in mgv7 well away from rivers,
---   so `nil` will be returned for many (x, z) co-ordinates.
--- * The spawn level returned is for a player spawn in unmodified terrain.
--- * The spawn level is intentionally above terrain level to cope with
---   full-node biome 'dust' nodes.
---
function core.get_spawn_level(x, z) end