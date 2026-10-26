--- @meta

-- --------
-- # Misc.:
-- --------


--- Returns list of `ObjectRefs`
---
--- @return Player[]
function core.get_connected_players() end

--- Boolean, whether `obj` is a player
---
function core.is_player(obj) end

--- Boolean, whether player exists
---   (regardless of online status)
---
---@param name string
---@return boolean
function core.player_exists(name) end

--- * Replaces definition of a builtin hud element
--- * `name`: `"breath"` or `"health"`
--- * `hud_definition`: definition to replace builtin definition
---
function core.hud_replace_builtin(name, hud_definition) end

--- * This function can be overridden by mods to change the join message.
---
function core.send_join_message(player_name) end

--- * This function can be overridden by mods to change the leave message.
---
function core.send_leave_message(player_name, timed_out) end

--- Returns an 48-bit integer
--- * `pos`: table {x=number, y=number, z=number},
--- * Gives a unique hash number for a node position (16+16+16=48bit)
---
function core.hash_node_position(pos) end

--- Returns a position
--- * Inverse transform of `core.hash_node_position`
---
function core.get_position_from_hash(hash) end

--- Returns a rating
--- * Get rating of a group of an item. (`0` means: not in group)
--- * If `group` is `nil`, returns `0`
---
--- @param name  string
--- @param group string|nil
--- @return      integer
function core.get_item_group(name, group) end

--- Returns a rating
--- * Deprecated: An alias for the former.
---
function core.get_node_group(name, group) end

--- Returns a rating
--- * Returns rating of the connect_to_raillike group corresponding to name
--- * If name is not yet the name of a connect_to_raillike group, a new group
---   id is created, with that name.
---
function core.raillike_group(name) end

--- Returns an integer
--- * Gets the internal content ID of `name`
---
--- @param name string
--- @return integer
function core.get_content_id(name) end

--- Returns a string
--- * Gets the name of the content with that content ID
---
function core.get_name_from_content_id(content_id) end

--- Returns something
--- * Convert a string containing JSON data into the Lua equivalent
--- * `nullvalue`: returned in place of the JSON null; defaults to `nil`
--- * On success returns a table, a string, a number, a boolean or `nullvalue`
--- * On failure outputs an error message and returns `nil`
--- * Example: `parse_json("[10, {\"a\":false}]")`, returns `{10, {a = false}}`
---
---@param string string
---@param nullvalue any
function core.parse_json(string, nullvalue) end

--- Returns a string or `nil` and an error
---   message.
--- * Convert a Lua table into a JSON string
--- * styled: Outputs in a human-readable format if this is set, defaults to
---   false.
--- * Unserializable things like functions and userdata will cause an error.
--- * **Warning**: JSON is more strict than the Lua table format.
---     1. You can only use strings and positive integers of at least one as
---        keys.
---     2. You can not mix string and integer keys.
---        This is due to the fact that JSON has two distinct array and object
---        values.
--- * Example: `write_json({10, {a = false}})`,
---   returns `"[10, {\"a\": false}]"`
---
--- @overload fun(data)
--- @param data table
--- @param styled boolean
--- @return string|nil
function core.write_json(data, styled) end

--- Returns a string
--- * Convert a table containing tables, strings, numbers, booleans and `nil`s
---   into string form readable by `core.deserialize`
--- * Example: `serialize({foo='bar'})`, returns `'return { ["foo"] = "bar" }'`
---
--- @param table
--- @return string
function core.serialize(table) end

--- Returns a table
--- * Convert a string returned by `core.serialize` into a table
--- * `string` is loaded in an empty sandbox environment.
--- * Will load functions if safe is false or omitted. Although these functions
---   cannot directly access the global environment, they could bypass this
---   restriction with maliciously crafted Lua bytecode if mod security is
---   disabled.
--- * This function should not be used on untrusted data, regardless of the
---  value of `safe`. It is fine to serialize then deserialize user-provided
---  data, but directly providing user input to deserialize is always unsafe.
--- * Example: `deserialize('return { ["foo"] = "bar" }')`,
---   returns `{foo='bar'}`
--- * Example: `deserialize('print("foo")')`, returns `nil`
---   (function call fails), returns
---   `error:[string "print("foo")"]:1: attempt to call global 'print' (a nil value)`
---
function core.deserialize(string, safe) end

--- Returns `compressed_data`
--- * Compress a string of data.
--- * `method` is a string identifying the compression method to be used.
--- * Supported compression methods:
---     * Deflate (zlib): `"deflate"`
--- * `...` indicates method-specific arguments. Currently defined arguments
---   are:
---     * Deflate: `level` - Compression level, `0`-`9` or `nil`.
---
function core.compress(data, method, ...) end

--- Returns data
--- * Decompress a string of data (using ZLib).
--- * See documentation on `core.compress()` for supported compression
---   methods.
--- * `...` indicates method-specific arguments. Currently, no methods use this
---
function core.decompress(compressed_data, method, ...) end

--- Returns a string
--- * Each argument is a 8 Bit unsigned integer
--- * Returns the ColorString from rgb or rgba values
--- * Example: `core.rgba(10, 20, 30, 40)`, returns `"#0A141E28"`
---
function core.rgba(red, green, blue, alpha) end

--- Returns string encoded in base64
--- * Encodes a string in base64.
---
function core.encode_base64(string) end

--- Returns string or nil for invalid base64
--- * Decodes a string encoded in base64.
---
function core.decode_base64(string) end

--- Returns boolean
--- * Returning `true` restricts the player `name` from modifying (i.e. digging,
---    placing) the node at position `pos`.
--- * `name` will be `""` for non-players or unknown players.
--- * This function should be overridden by protection mods. It is highly
---   recommended to grant access to players with the `protection_bypass` privilege.
--- * Cache and call the old version of this function if the position is
---   not protected by the mod. This will allow using multiple protection mods.
--- * Example:
---
---       local old_is_protected = core.is_protected
---       function core.is_protected(pos, name)
---           if mymod:position_protected_from(pos, name) then
---               return true
---           end
---           return old_is_protected(pos, name)
---       end
---
function core.is_protected(pos, name) end

--- * This function calls functions registered with
---   `core.register_on_protection_violation`.
---
function core.record_protection_violation(pos, name) end

--- Returns boolean
--- * Returning `true` means that Creative Mode is enabled for player `name`.
--- * `name` will be `""` for non-players or if the player is unknown.
--- * This function should be overridden by Creative Mode-related mods to
---   implement a per-player Creative Mode.
--- * By default, this function returns `true` if the setting
---   `creative_mode` is `true` and `false` otherwise.
---
function core.is_creative_enabled(name) end

--- * Returns the position of the first node that `player_name` may not modify
---   in the specified cuboid between `pos1` and `pos2`.
--- * Returns `false` if no protections were found.
--- * Applies `is_protected()` to a 3D lattice of points in the defined volume.
---   The points are spaced evenly throughout the volume and have a spacing
---   similar to, but no larger than, `interval`.
--- * All corners and edges of the defined volume are checked.
--- * `interval` defaults to 4.
--- * `interval` should be carefully chosen and maximised to avoid an excessive
---   number of points being checked.
--- * Like `core.is_protected`, this function may be extended or
---   overwritten by mods to provide a faster implementation to check the
---   cuboid for intersections.
---
function core.is_area_protected(pos1, pos2, player_name, interval) end

--- * Attempt to predict the desired orientation of the facedir-capable node
---   defined by `itemstack`, and place it accordingly (on-wall, on the floor,
---   or hanging from the ceiling).
--- * `infinitestacks`: if `true`, the itemstack is not changed. Otherwise the
---   stacks are handled normally.
--- * `orient_flags`: Optional table containing extra tweaks to the placement code:
---     * `invert_wall`:   if `true`, place wall-orientation on the ground and
---       ground-orientation on the wall.
---     * `force_wall` :   if `true`, always place the node in wall orientation.
---     * `force_ceiling`: if `true`, always place on the ceiling.
---     * `force_floor`:   if `true`, always place the node on the floor.
---     * `force_facedir`: if `true`, forcefully reset the facedir to north
---       when placing on the floor or ceiling.
---     * The first four options are mutually-exclusive; the last in the list
---       takes precedence over the first.
--- * `prevent_after_place` is directly passed to `core.item_place_node`
--- * Returns the new itemstack after placement
---
--- @param itemstack           ItemStack
--- @param placer              Player
--- @param pointed_thing       pointed_thing
--- @param infinite_stacks     boolean
--- @param orient_flags        {invert_wall:boolean,force_wall:boolean,force_ceiling:boolean,force_floor:boolean,force_facedir:boolean}
--- @param prevent_after_place boolean
--- @return ItemStack
function core.rotate_and_place(itemstack, placer, pointed_thing, infinite_stacks, orient_flags, prevent_after_place) end

--- * calls `rotate_and_place()` with `infinitestacks` set according to the state
---   of the creative mode setting, checks for "sneak" to set the `invert_wall`
---   parameter and `prevent_after_place` set to `true`.
---
---
--- @param itemstack     ItemStack
--- @param placer        Player
--- @param pointed_thing pointed_thing
--- @return ItemStack
function core.rotate_node(itemstack, placer, pointed_thing) end

--- * Returns the amount of knockback applied on the punched player.
--- * Arguments are equivalent to `register_on_punchplayer`, except the following:
---     * `distance`: distance between puncher and punched player
--- * This function can be overriden by mods that wish to modify this behaviour.
--- * You may want to cache and call the old function to allow multiple mods to
---   change knockback behaviour.
---
function core.calculate_knockback(player, hitter, time_from_last_punch,  tool_capabilities, dir, distance, damage) end

--- * forceloads the position `pos`.
--- * returns `true` if area could be forceloaded
--- * If `transient` is `false` or absent, the forceload will be persistent
---   (saved between server runs). If `true`, the forceload will be transient
---   (not saved between server runs).
---
--- @param pos MapPosition
function core.forceload_block(pos, transient) end

--- * stops forceloading the position `pos`
--- * If `transient` is `false` or absent, frees a persistent forceload.
---   If `true`, frees a transient forceload.
---
--- @param pos MapPosition
function core.forceload_free_block(pos, transient) end

--- Returns an environment containing
---   insecure functions if the calling mod has been listed as trusted in the
---   `secure.trusted_mods` setting or security is disabled, otherwise returns
---   `nil`.
--- * Only works at init time and must be called from the mod's main scope
---   (ie: the init.lua of the mod, not from another Lua file or within a function).
--- * **DO NOT ALLOW ANY OTHER MODS TO ACCESS THE RETURNED ENVIRONMENT, STORE
---   IT IN A LOCAL VARIABLE!**
---
function core.request_insecure_environment() end

--- * Checks if a global variable has been set, without triggering a warning.
---
function core.global_exists(name) end
