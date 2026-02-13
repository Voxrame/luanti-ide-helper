---@meta

--
-- Engine-provided globals
--

-- INIT = "game"

--
-- Classes
--
--- See ./classes/AreaStore.lua

--- @class NodeTable
--- @field name string
--- @field param1 integer?  8-bit integer ranging from 0 to 255
--- @field param2 integer?  8-bit integer ranging from 0 to 255
NodeTable = {}

--- @class MapNode: NodeTable
--- @field force_place? boolean if the node should forcibly overwrite any previous contents (default: false)


--- See ./classes/NodeMetaRef.lua

--- See ./classes/VoxelArea.lua

--- See ./classes/ObjectRef.lua

--- See ./classes/Player.lua

---@class PseudoRandom
PseudoRandom = {}

--- See ./classes/ItemStack.lua

--- See ./classes/InvRef.lua

--- @class pointed_thing
--- @field public type  string one of {"nothing"|"node"|"object"}
--- @field public above Position refers to the node position in front of the pointed face (only if type=="node")
--- @field public under Position refers to the node position behind the pointed face (only if type=="node")
--- @field public ref   ObjectRef only if type=="object"
--- @field public intersection_point Position The absolute world coordinates of the point on the selection box which is pointed at. May be in the selection box if the pointer is in the box too
--- @field public box_id number The ID of the pointed selection box (counting starts from 1)
--- @field public intersection_normal Position Unit vector, points outwards of the selected selection box. This specifies which face is pointed at. Is a null vector `vector.zero()` when the pointer is inside the selection box.
---


--
-- `minetest.` / `core.` functions
--

core = {}
--- for backward compatibilit
--- @legacy
minetest = core



-- Escape sequences:

--- * `color` is a ColorString
--- * The escape sequence sets the text color to `color`
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L3107-L3109)
---
--- @param color ColorString
--- @return string
function core.get_color_escape_sequence(color) end

--- * Equivalent to:
---   `core.get_color_escape_sequence(color) ..
---   message ..
---   core.get_color_escape_sequence("#ffffff")`
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L3110-L3114)
---
--- @param color ColorString
--- @param message string
--- @return string
function core.colorize(color, message) end

--- * `color` is a ColorString
--- * The escape sequence sets the background of the whole text element to
---   `color`. Only defined for item descriptions and tooltips.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L3115-L3118)
---
--- @param color ColorString
--- @return string
function core.get_background_escape_sequence(color) end

--- * Removes foreground colors added by `get_color_escape_sequence`.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L3119-L3120)
--- @param str string
--- @return string
function core.strip_foreground_colors(str) end
--- * Removes background colors added by `get_background_escape_sequence`.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L3121-L3122)
---
--- @param str string
--- @return string
function core.strip_background_colors(str) end

--- * Removes all color escape sequences.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L3123-L3124)
---
--- @param str string
--- @return string
function core.strip_colors(str) end



-- Helpers:

--- returns a string or table
--- * Adds newlines to the string to keep it within the specified character
---   limit
--- * Note that the returned lines may be longer than the limit since it only
---   splits at word borders.
--- * `limit`: number, maximal amount of characters in one line
--- * `as_table`: boolean, if set to true, a table of lines instead of a string
---   is returned, default: `false`
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L3244-L3251)
---
--- @param str       string
--- @param limit     number
--- @param as_table? boolean
--- @return string|table
function core.wrap_text(str, limit, as_table) end

--- returns string `"(X,Y,Z)"`
--- * `pos`: table {x=X, y=Y, z=Z}
--- * Converts the position `pos` to a human-readable, printable string
--- * `decimal_places`: number, if specified, the x, y and z values of
---   the position are rounded to the given decimal place.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L3252-L3256)
---
--- @param pos             Position
--- @param decimal_places? number
--- @return string
function core.pos_to_string(pos, decimal_places) end

--- returns a position or `nil`
--- * Same but in reverse.
--- * If the string can't be parsed to a position, nothing is returned.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L3257-L3259)
---
--- @param string string
--- @return Position
function core.string_to_pos(string) end

--- returns two positions
--- * Converts a string representing an area box into two positions
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L3260-L3261)
--- Since 5.6:
--- * X1, Y1, ... Z2 are coordinates
--- * `relative_to`: Optional. If set to a position, each coordinate
---   can use the tilde notation for relative positions
--- * Tilde notation: "~": Relative coordinate
---                   "~<number>": Relative coordinate plus <number>
--- * Example: `core.string_to_area("(1,2,3) (~5,~-5,~)", {x=10,y=10,z=10})`
---   returns `{x=1,y=2,z=3}, {x=15,y=5,z=10}`
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.6.1/doc/lua_api.txt#L3581-L3590)
--- @param area_string  string
--- @param relative_to? Position
--- @return Position, Position
function core.string_to_area(area_string, relative_to) end

--- returns a string
--- * escapes the characters "[", "]", "\", "," and ";", which can not be used
---   in formspecs.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L3262-L3264)
--- @param string string
--- @return string
function core.formspec_escape(string) end

--- * returns true if passed 'y', 'yes', 'true' or a number that isn't zero.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L3265-L3266)
--- @param arg any
--- @return boolean
function core.is_yes(arg) end
--- * returns true when the passed number represents NaN.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L3267-L3268)
--- @param arg any
--- @return boolean
function core.is_nan(arg) end
--- * returns time with microsecond precision. May not return wall time.
--- * This value might overflow on certain 32-bit systems!
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L3269-L3271)
---@return number
function core.get_us_time() end
--- returns a position.
--- * returns the exact position on the surface of a pointed node
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L3291-L3293)
--- @param placer        Player|ObjectRef
--- @param pointed_thing pointed_thing
--- @return Position
function core.pointed_thing_to_face_pos(placer, pointed_thing) end

--- Simulates a tool that digs a node.
--- Returns a table with the following fields:
--- * `diggable`: `true` if node can be dug, `false` otherwise.
--- * `time`: Time it would take to dig the node.
--- * `wear`: How much wear would be added to the tool.
--- `time` and `wear` are meaningless if node's not diggable
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L3294-L3303)
---
--- @param groups            table  Table of the node groups of the node that would be dug
--- @param tool_capabilities table  Tool capabilities table of the tool
--- @return {diggable: boolean, time: number, wear: number}
function core.get_dig_params(groups, tool_capabilities) end

--- Simulates an item that punches an object.
--- Returns a table with the following fields:
--- * `hp`: How much damage the punch would cause.
--- * `wear`: How much wear would be added to the tool.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L3304-L3312)
---
--- @param groups                table   Damage groups of the object
--- @param tool_capabilities     table   Tool capabilities table of the item
--- @param time_from_last_punch? number  [Optional] time in seconds since last punch action
--- @return {hp: number, wear: number}
function core.get_hit_params(groups, tool_capabilities , time_from_last_punch) end



-- Translations

--- is a simple wrapper around
---   `core.translate`, and `core.get_translator(textdomain)(str, ...)` is
---   equivalent to `core.translate(textdomain, str, ...)`.
---   It is intended to be used in the following way, so that it avoids verbose
---   repetitions of `core.translate`:
---
---   local S = core.get_translator(textdomain)
---   S(str, ...)
---
---   As an extra commodity, if `textdomain` is nil, it is assumed to be "" instead.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L3329-L3338)
---
--- @param text_domain string
--- @return fun(str: string, ...):string
function core.get_translator(text_domain) end
--- translates the string `str` with
---   the given `textdomain` for disambiguation. The textdomain must match the
---   textdomain specified in the translation file in order to get the string
---   translated. This can be used so that a string is translated differently in
---   different contexts.
---   It is advised to use the name of the mod as textdomain whenever possible, to
---   avoid clashes with other mods.
---   This function must be given a number of arguments equal to the number of
---   arguments the translated string expects.
---   Arguments are literal strings -- they will not be translated, so if you want
---   them to be, they need to come as outputs of `core.translate` as well.
---
---   For instance, suppose we want to translate "@1 Wool" with "@1" being replaced
---   by the translation of "Red". We can do the following:
---
---   local S = core.get_translator()
---   S("@1 Wool", S("Red"))
---
---   This will be displayed as "Red Wool" on old clients and on clients that do
---   not have localization enabled. However, if we have for instance a translation
---   file named `wool.fr.tr` containing the following:
---
---   @1 Wool=Laine @1
---   Red=Rouge
---
---   this will be displayed as "Laine Rouge" on clients with a French locale.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L3340-L3365)
---
--- @param textdomain string
--- @param str string
--- @return string
function core.translate(textdomain, str, ...) end



-- Logging:
-- see ./core_namespace/logging.lua


-- Registration functions:
-- Environment:
-- see ./core_namespace/registration/environment.lua
-- Gameplay:
-- see ./core_namespace/registration/gameplay.lua


-- Global callback registration functions:
--- * Called every server step, usually interval of 0.1s
--- * `delta_time` is the time since last execution in seconds.
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4564-L4565)
--- @param callback fun(delta_time:number)
function core.register_globalstep(callback) end
--- * Called after mods have finished loading and before the media is cached or the
---   aliases handled.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4566-L4568)
--- @param callback fun()
function core.register_on_mods_loaded(callback) end
--- * Called before server shutdown
--- * **Warning**: If the server terminates abnormally (i.e. crashes), the
---   registered callbacks **will likely not be run**. Data should be saved at
---   semi-frequent intervals as well as on server shutdown.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4569-L4573)
--- @param callback fun()
function core.register_on_shutdown(callback) end
--- * Called when a node has been placed
--- * If return `true` no item is taken from `itemstack`
--- * `placer` may be any valid ObjectRef or nil.
--- * **Not recommended**; use `on_construct` or `after_place_node` in node
---   definition whenever possible.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4574-L4579)
--- @param callback fun(pos, newnode, placer, oldnode, itemstack, pointed_thing)
function core.register_on_placenode(callback) end
--- * Called when a node has been dug.
--- * **Not recommended**; Use `on_destruct` or `after_dig_node` in node
---   definition whenever possible.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4580-L4583)
--- @param callback fun(pos, oldnode, digger)
function core.register_on_dignode(callback) end
--- * Called when a node is punched
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4584-L4585)
--- @param callback fun(pos, node, puncher, pointed_thing)
function core.register_on_punchnode(callback) end

--- * Called after the engine mapgen finishes a chunk but before it is written to the map.
--- * Chunk data resides in `vmanip`. Other parts of the map are not accessible.
---   The area of the chunk if comprised of `minp` and `maxp`,
---     note that is smaller than the emerged area of the VoxelManip.
---   Note: calling `read_from_map()` or `write_to_map()`
---     on the VoxelManipulator object is not necessary and is disallowed.
--- * `blockseed`: 64-bit seed number used for this chunk.
---
--- @overload fun(callback:fun(min_pos:MapPosition, max_pos:MapPosition, blockseed:number))
--- @param callback fun(vmanip:VoxelManip, min_pos:MapPosition, max_pos:MapPosition, blockseed:number)
function core.register_on_generated(callback) end
--- * Called when a new player enters the world for the first time
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4589-L4590)
--- @param callback fun(player:Player)
function core.register_on_newplayer(callback) end
--- * Called when a player is punched
--- * Note: This callback is invoked even if the punched player is dead.
--- * `player`: ObjectRef - Player that was punched
--- * `hitter`: ObjectRef - Player that hit
--- * `time_from_last_punch`: Meant for disallowing spamming of clicks
---   (can be nil).
--- * `tool_capabilities`: Capability table of used tool (can be nil)
--- * `dir`: Unit vector of direction of punch. Always defined. Points from
---   the puncher to the punched.
--- * `damage`: Number that represents the damage calculated by the engine
--- * should return `true` to prevent the default damage mechanism
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4591-L4602)
--- @param callback fun(player:Player, hitter:Player, time_from_last_punch:number|nil, tool_capabilities, dir, damage)
function core.register_on_punchplayer(callback) end
--- * Called when a player is right-clicked
--- * `player`: ObjectRef - Player that was right-clicked
--- * `clicker`: ObjectRef - Object that right-clicked, may or may not be a player
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4603-L4606)
--- @param callback fun(player:Player, clicker:Player)
function core.register_on_rightclickplayer(callback) end

--- @alias PlayerHPChangeReasonType
--- | "set_hp"      # A mod or the engine called `set_hp` without giving a type - use this for custom damage types.
--- | "punch"       # Was punched. `reason.object` will hold the puncher, or nil if none.
--- | "fall"        # A fall.
--- | "node_damage" # `damage_per_second` from a neighbouring node. `reason.node` will hold the node name or nil.
--- | "drown"       # Drowning damage.
--- | "respawn"     # Respawning.


--- @class PlayerHPChangeReason
--- @field type PlayerHPChangeReasonType one of `"set_hp"`, `"punch"`, ... See `register_on_player_hpchange` description.
--- @field from string will be `"mod"` or `"engine"`
--- @field object ObjectRef|Player|Entity
--- @field node string|nil
--- @field node_pos MapPosition|nil

--- * Called when the player gets damaged or healed
--- * `player`: ObjectRef of the player
--- * `hp_change`: the amount of change. Negative when it is damage.
--- * `reason`: a PlayerHPChangeReason table.
---     * The `type` field will have one of the following values:
---         * `set_hp`: A mod or the engine called `set_hp` without
---                     giving a type - use this for custom damage types.
---         * `punch`: Was punched. `reason.object` will hold the puncher, or nil if none.
---         * `fall`
---         * `node_damage`: `damage_per_second` from a neighbouring node.
---                          `reason.node` will hold the node name or nil.
---         * `drown`
---         * `respawn`
---     * Any of the above types may have additional fields from mods.
---     * `reason.from` will be `mod` or `engine`.
--- * `modifier`: when true, the function should return the actual `hp_change`.
---    Note: modifiers only get a temporary `hp_change` that can be modified by later modifiers.
---    Modifiers can return true as a second argument to stop the execution of further functions.
---    Non-modifiers receive the final HP change calculated by the modifiers.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4607-L4626)
--- @param callback fun(player:Player, hp_change:number, reason:PlayerHPChangeReason)|fun(player:Player, hp_change:number, reason:PlayerHPChangeReason):number,boolean
--- @param modifier boolean
function core.register_on_player_hpchange(callback, modifier) end
--- * Called when a player dies
--- * `reason`: a PlayerHPChangeReason table, see register_on_player_hpchange
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4627-L4629)
--- @param callback fun(player:ObjectRef, reason:PlayerHPChangeReason)
function core.register_on_dieplayer(callback) end
--- * Called when player is to be respawned
--- * Called _before_ repositioning of player occurs
--- * return true in func to disable regular player placement
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4630-L4633)
--- @param callback fun(player:ObjectRef):boolean|nil
function core.register_on_respawnplayer(callback) end
--- * Called when a client connects to the server, prior to authentication
--- * If it returns a string, the client is disconnected with that string as
---   reason.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4634-L4637)
--- @param callback fun(name:string, ip:string):nil|string
function core.register_on_prejoinplayer(callback) end
--- * Called when a player joins the game
--- * `last_login`: The timestamp of the previous login, or nil if player is new
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4638-L4640)
--- @param callback fun(player:Player, last_login:number)
function core.register_on_joinplayer(callback) end
--- * Called when a player leaves the game
--- * `timed_out`: True for timeout, false for other reasons.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4641-L4643)
--- @param callback fun(player:Player, timed_out:boolean)
function core.register_on_leaveplayer(callback) end
--- * Called when a client attempts to log into an account.
--- * `name`: The name of the account being authenticated.
--- * `ip`: The IP address of the client
--- * `is_success`: Whether the client was successfully authenticated
--- * For newly registered accounts, `is_success` will always be true
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4644-L4649)
--- @param callback fun(name, ip, is_success)
function core.register_on_authplayer(callback) end
--- * Deprecated: use `core.register_on_authplayer(name, ip, is_success)` instead.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4650-L4651)
--- @deprecated
--- @param callback fun(name, ip)
function core.register_on_auth_fail(callback) end
--- * Called when a player cheats
--- * `cheat`: `{type=<cheat_type>}`, where `<cheat_type>` is one of:
---     * `moved_too_fast`
---     * `interacted_too_far`
---     * `interacted_with_self`
---     * `interacted_while_dead`
---     * `finished_unknown_dig`
---     * `dug_unbreakable`
---     * `dug_too_fast`
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4652-L4661)
--- @param callback fun(ObjectRef, cheat)
function core.register_on_cheat(callback) end
--- * Called always when a player says something
--- * Return `true` to mark the message as handled, which means that it will
---   not be sent to other players.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4662-L4665)
--- @param callback fun(name, message)
function core.register_on_chat_message(callback) end
--- * Called always when a chatcommand is triggered, before `core.registered_chatcommands`
---   is checked to see if the command exists, but after the input is parsed.
--- * Return `true` to mark the command as handled, which means that the default
---   handlers will be prevented.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4666-L4670)
--- @param callback fun(name, command, params)
function core.register_on_chatcommand(callback) end
--- * Called when the server received input from `player` in a formspec with
---   the given `formname`. Specifically, this is called on any of the
---   following events:
---       * a button was pressed,
---       * Enter was pressed while the focus was on a text field
---       * a checkbox was toggled,
---       * something was selected in a dropdown list,
---       * a different tab was selected,
---       * selection was changed in a textlist or table,
---       * an entry was double-clicked in a textlist or table,
---       * a scrollbar was moved, or
---       * the form was actively closed by the player.
--- * Fields are sent for formspec elements which define a field. `fields`
---   is a table containing each formspecs element value (as string), with
---   the `name` parameter as index for each. The value depends on the
---   formspec element type:
---     * `animated_image`: Returns the index of the current frame.
---     * `button` and variants: If pressed, contains the user-facing button
---       text as value. If not pressed, is `nil`
---     * `field`, `textarea` and variants: Text in the field
---     * `dropdown`: Either the index or value, depending on the `index event`
---       dropdown argument.
---     * `tabheader`: Tab index, starting with `"1"` (only if tab changed)
---     * `checkbox`: `"true"` if checked, `"false"` if unchecked
---     * `textlist`: See `core.explode_textlist_event`
---     * `table`: See `core.explode_table_event`
---     * `scrollbar`: See `core.explode_scrollbar_event`
---     * Special case: `["quit"]="true"` is sent when the user actively
---       closed the form by mouse click, keypress or through a button_exit[]
---       element.
---     * Special case: `["key_enter"]="true"` is sent when the user pressed
---       the Enter key and the focus was either nowhere (causing the formspec
---       to be closed) or on a button. If the focus was on a text field,
---       additionally, the index `key_enter_field` contains the name of the
---       text field. See also: `field_close_on_enter`.
--- * Newest functions are called first
--- * If function returns `true`, remaining functions are not called
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4671-L4708)
--- @param callback fun(player, formname, fields)
function core.register_on_player_receive_fields(callback) end
--- * Called when `player` crafts something
--- * `itemstack` is the output
--- * `old_craft_grid` contains the recipe (Note: the one in the inventory is
---   cleared).
--- * `craft_inv` is the inventory with the crafting grid
--- * Return either an `ItemStack`, to replace the output, or `nil`, to not
---   modify it.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4709-L4716)
--- @param callback fun(itemstack, player, old_craft_grid, craft_inv)
function core.register_on_craft(callback) end
--- * The same as before, except that it is called before the player crafts, to
---   make craft prediction, and it should not change anything.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4717-L4719)
--- @param callback fun(itemstack, player, old_craft_grid, craft_inv)
function core.register_craft_predict() end
--- * Determines how much of a stack may be taken, put or moved to a
---   player inventory.
--- * `player` (type `ObjectRef`) is the player who modified the inventory
---   `inventory` (type `InvRef`).
--- * List of possible `action` (string) values and their
---   `inventory_info` (table) contents:
---     * `move`: `{from_list=string, to_list=string, from_index=number, to_index=number, count=number}`
---     * `put`:  `{listname=string, index=number, stack=ItemStack}`
---     * `take`: Same as `put`
--- * Return a numeric value to limit the amount of items to be taken, put or
---   moved. A value of `-1` for `take` will make the source stack infinite.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4720-L4731)
--- @param callback fun(player, action, inventory, inventory_info)
function core.register_allow_player_inventory_action() end
--- * Called after a take, put or move event from/to/in a player inventory
--- * Function arguments: see `core.register_allow_player_inventory_action`
--- * Does not accept or handle any return value.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4732-L4735)
--- @param callback fun(player, action, inventory, inventory_info)
function core.register_on_player_inventory_action() end
--- * Called by `builtin` and mods when a player violates protection at a
---   position (eg, digs a node or punches a protected entity).
--- * The registered functions can be called using
---   `core.record_protection_violation`.
--- * The provided function should check that the position is protected by the
---   mod calling this function before it prints a message, if it does, to
---   allow for multiple protection mods.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4736-L4743)
--- @param callback fun(pos, name)
function core.register_on_protection_violation() end
--- * Called when an item is eaten, by `core.item_eat`
--- * Return `itemstack` to cancel the default item eat response (i.e.: hp increase).
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4744-L4746)
--- @param callback fun(hp_change, replace_with_item, itemstack, user, pointed_thing)
function core.register_on_item_eat() end
--- * Called when `granter` grants the priv `priv` to `name`.
--- * Note that the callback will be called twice if it's done by a player,
---   once with granter being the player name, and again with granter being nil.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4747-L4750)
--- @param callback fun(name, granter, priv)
function core.register_on_priv_grant() end
--- * Called when `revoker` revokes the priv `priv` from `name`.
--- * Note that the callback will be called twice if it's done by a player,
---   once with revoker being the player name, and again with revoker being nil.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4751-L4754)
--- @param callback fun(name, revoker, priv)
function core.register_on_priv_revoke() end
--- * Called when `name` user connects with `ip`.
--- * Return `true` to by pass the player limit
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4755-L4757)
--- @param callback fun(name, ip)
function core.register_can_bypass_userlimit() end
--- * Called when an incoming mod channel message is received
--- * You should have joined some channels to receive events.
--- * If message comes from a server mod, `sender` field is an empty string.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4758-L4761)
--- @param callback fun(channel_name, sender, message)
function core.register_on_modchannel_message() end

-- Setting-related:
--- @type Settings
core.settings = {}

--- Loads a setting from the main settings and
---   parses it as a position (in the format `(1,2,3)`). Returns a position or nil.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4768-L4769)
function core.setting_get_pos(name) end

-- Authentication:
--- * Converts string representation of privs into table form
--- * `delim`: [Optional] String separating the privs. Defaults to `","`.
--- * Returns `{ priv1 = true, ... }`
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4774-L4777)
--- @param str   string
--- @param delim string
--- @return table<string,boolean>
function core.string_to_privs(str, delim) end
--- * Returns the string representation of `privs`
--- * `delim`: [Optional] String to delimit privs. Defaults to `","`.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4778-L4780)
--- @param privs table<string,boolean>
--- @param delim string
--- @return string
function core.privs_to_string(privs, delim) end
--- Returns -> {priv1=true,...}
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4781-L4781)
--- @param name string
--- @return table<string,boolean>
function core.get_player_privs(name) end
--- Returns `bool, missing_privs`
--- * A quickhand for checking privileges.
--- * `player_or_name`: Either a Player object or the name of a player.
--- * `...` is either a list of strings, e.g. `"priva", "privb"` or
---   a table, e.g. `{ priva = true, privb = true }`.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4782-L4787)
--- @param player_or_name Player|string
--- @return boolean,table
function core.check_player_privs(player_or_name, ...) end
--- * Returns true if the "password entry" for a player with name matches given
---   password, false otherwise.
--- * The "password entry" is the password representation generated by the
---   engine as returned as part of a `get_auth()` call on the auth handler.
--- * Only use this function for making it possible to log in via password from
---   external protocols such as IRC, other uses are frowned upon.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4789-L4795)
function core.check_password_entry(name, entry, password) end
--- * Convert a name-password pair to a password hash that Minetest can use.
--- * The returned value alone is not a good basis for password checks based
---   on comparing the password hash in the database with the password hash
---   from the function, with an externally provided password, as the hash
---   in the db might use the new SRP verifier format.
--- * For this purpose, use `core.check_password_entry` instead.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4796-L4802)
function core.get_password_hash(name, raw_password) end
--- Returns an IP address string for the player
---   `name`.
--- * The player needs to be online for this to be successful.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4803-L4805)
function core.get_player_ip(name) end
--- Return the currently active auth handler
--- * See the [Authentication handler definition]
--- * Use this to e.g. get the authentication data for a player:
---   `local auth_data = core.get_auth_handler().get_auth(playername)`
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4807-L4810)
---@return AuthenticationHandlerDefinition
function core.get_auth_handler() end
--- * Must be called by the authentication handler for privilege changes.
--- * `name`: string; if omitted, all auth data should be considered modified
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4811-L4813)
function core.notify_authentication_modified(name) end
--- Set password hash of
---   player `name`.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4814-L4815)
function core.set_player_password(name, password_hash) end
--- Set privileges of player
---   `name`.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4816-L4817)
--- @param name  string
--- @param privs table<string,boolean>  object like `{priv1=true,...}`
function core.set_player_privs(name, privs) end
--- * See `reload()` in authentication handler definition
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4818-L4819)
function core.auth_reload() end

-- Chat:
--- @param text string
function core.chat_send_all(text) end
--- @param name string player name to send to
--- @param text string
function core.chat_send_player(name, text) end
--- * Used by the server to format a chat message, based on the setting `chat_message_format`.
---   Refer to the documentation of the setting for a list of valid placeholders.
--- * Takes player name and message, and returns the formatted string to be sent to players.
--- * Can be redefined by mods if required, for things like colored names or messages.
--- * **Only** the first occurrence of each placeholder will be replaced.
--- @param name    string player name to send to
--- @param message string
function core.format_chat_message(name, message) end

-- Environment access:
--- @param pos  MapPosition
--- @param node NodeTable
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4840-L4840)
function core.set_node(pos, node) end
--- Alias to `core.set_node`
--- * Set node at position `pos`
--- * `node`: table `{name=string, param1=number, param2=number}`
--- * If param1 or param2 is omitted, it's set to `0`.
--- * e.g. `core.set_node({x=0, y=10, z=0}, {name="default:wood"})`
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4841-L4845)
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
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4846-L4855)
---
--- @param positions MapPosition[] {pos1, pos2, pos3, ...}
--- @param node      NodeTable
function core.bulk_set_node(positions, node) end

--- Swap node at position with another.
--- * This keeps the metadata intact and will not run con-/destructor callbacks.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4856-L4857)
---
--- @param pos  MapPosition
--- @param node NodeTable
function core.swap_node(pos, node) end

--- Equivalent to core.set_node(pos, {name="air"}), but a bit faster.
--- (Any existing metadata is deleted.)
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4858-L4859)
--- @param pos MapPosition
function core.remove_node(pos) end
--- * Returns the node at the given position as table in the format
---   `{name="node_name", param1=0, param2=0}`,
---   returns `{name="ignore", param1=0, param2=0}` for unloaded areas.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4860-L4863)
---@param pos MapPosition
---@return NodeTable
function core.get_node(pos) end
--- * Same as `get_node` but returns `nil` for unloaded areas.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4864-L4865)
--- @param pos MapPosition
--- @return NodeTable|nil
function core.get_node_or_nil(pos) end
--- * Gets the light value at the given position. Note that the light value
---   "inside" the node at the given position is returned, so you usually want
---   to get the light value of a neighbor.
--- * Returns a number between `0` and `15` or `nil`
--- * `nil` is returned e.g. when the map isn't loaded at `pos`
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4866-L4873)
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
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4874-L4881)
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
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4882-L4888)
function core.get_artificial_light(param1) end
--- * Place node with the same effects that a player would cause
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4889-L4890)
--- @param pos  MapPosition
--- @param node NodeTable
function core.place_node(pos, node) end
--- * Dig node with the same effects that a player would cause
--- * Returns `true` if successful, `false` on failure (e.g. protected location)
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4891-L4893)
--- @param pos  MapPosition
function core.dig_node(pos) end
--- * Punch node with the same effects that a player would cause
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4894-L4895)
--- @param pos  MapPosition
function core.punch_node(pos) end
--- * Change node into falling node
--- * Returns `true` if successful, `false` on failure
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4896-L4898)
--- @param pos  MapPosition
function core.spawn_falling_node(pos) end
--- * Get a table of positions of nodes that have metadata within a region
---   {pos1, pos2}.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4900-L4902)
--- @param pos1 MapPosition
--- @param pos2 MapPosition
function core.find_nodes_with_meta(pos1, pos2) end
--- * Get a `NodeMetaRef` at that position
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4903-L4904)
--- @param pos MapPosition
--- @return NodeMetaRef
function core.get_meta(pos) end
--- * Get `NodeTimerRef`
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4905-L4906)
--- @param pos MapPosition
--- @return NodeTimerRef
function core.get_node_timer(pos) end
--- Spawn Lua-defined entity at
---   position.
--- * Returns `ObjectRef`, or `nil` if failed
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4908-L4910)
--- `staticdata` [Optional] no info
--- @param pos        Position
--- @param name       string
--- @param staticdata string?
--- @return ObjectRef|Entity|nil
function core.add_entity(pos, name, staticdata) end
--- Spawn item
--- * Returns `ObjectRef`, or `nil` if failed
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4911-L4912)
--- @param pos   Position
--- @return ObjectRef|nil
function core.add_item(pos, item) end
--- Get an `ObjectRef` to a player
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4913-L4913)
--- @param name string
--- @return Player|nil
function core.get_player_by_name(name) end
--- Returns a list of
---   ObjectRefs.
--- * `radius`: using an euclidean metric
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4914-L4916)
--- @param pos Position
--- @param radius number
--- @return ObjectRef[]|Entity[]|Player[]
function core.get_objects_inside_radius(pos, radius) end
--- Returns a list of
---   ObjectRefs.
---  * `pos1` and `pos2` are the min and max positions of the area to search.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4917-L4919)
--- @param pos1 Position
--- @param pos2 Position
--- @return ObjectRef[]|Entity[]|Player[]
function core.get_objects_in_area(pos1, pos2) end
--- * `val` is between `0` and `1`; `0` for midnight, `0.5` for midday
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4920-L4921)
---@param val number
function core.set_timeofday(val) end
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4922-L4922)
---@return number
function core.get_timeofday() end
--- Returns the time, in seconds, since the world was
---   created.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4923-L4924)
function core.get_gametime() end
--- Returns number days elapsed since world was
---   created.
--- * accounts for time changes.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4925-L4927)
function core.get_day_count() end
--- Returns pos or `nil`.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4928-L4933)
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
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4934-L4943)
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
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4944-L4948)
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
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4955-L4957)
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
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4970-L4971)
function core.get_gen_notify() end
--- * Returns the decoration ID number for the provided decoration name string,
---   or `nil` on failure.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4972-L4974)
function core.get_decoration_id(decoration_name) end

--- * `voxelmanip` - VoxelManip object
--- * `heightmap` - 2D array of height values (y)
--- * `biomemap` - 2D array of biome IDs
--- * `heatmap` - 2D array of heat values (0-255)
--- * `humiditymap` - 2D array of humidity values (0-255)
--- * `gennotify` - Table of on-generate notifications (see `core.set_gen_notify`)
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4970-L4971)
--- @alias MapgenObjectName
--- | "voxelmanip" # VoxelManip object
--- | "heightmap" # 2D? array of height values (y)
--- | "biomemap" # 2D? array of biome IDs
--- | "heatmap" # 2D? array of heat values (0-255)
--- | "humiditymap" # 2D? array of humidity values (0-255)
--- | "gennotify" # Table of on-generate notifications (see `core.set_gen_notify`)

--- Returns requested mapgen object if available (see [Mapgen objects])
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4975-L4976)
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
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4977-L4978)
--- @param pos MapPosition
function core.get_heat(pos) end
--- * Returns the humidity at the position, or `nil` on failure.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4979-L4980)
--- @param pos MapPosition
function core.get_humidity(pos) end
--- * Returns a table containing:
---     * `biome` the biome id of the biome at that position
---     * `heat` the heat at the position
---     * `humidity` the humidity at the position
--- * Or returns `nil` on failure.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4981-L4986)
--- @param pos MapPosition
function core.get_biome_data(pos) end
--- * Returns the biome id, as used in the biomemap Mapgen object and returned
---   by `core.get_biome_data(pos)`, for a given biome_name string.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4987-L4989)
function core.get_biome_id(biome_name) end
--- * Returns the biome name string for the provided biome id, or `nil` on
---   failure.
--- * If no biomes have been registered, such as in mgv6, returns `default`.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4990-L4993)
function core.get_biome_name(biome_id) end
--- * Deprecated: use `core.get_mapgen_setting(name)` instead.
--- * Returns a table containing:
---     * `mgname`
---     * `seed`
---     * `chunksize`
---     * `water_level`
---     * `flags`
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L4994-L5001)
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
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5002-L5018)
function core.set_mapgen_params(MapgenParams) end
--- * Gets the *active* mapgen setting (or nil if none exists) in string
---   format with the following order of precedence:
---     1) Settings loaded from map_meta.txt or overrides set during mod
---        execution.
---     2) Settings set by mods without a metafile override
---     3) Settings explicitly set in the user config file, minetest.conf
---     4) Settings set as the user config default
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5019-L5026)
--- @return string|nil
function core.get_mapgen_setting(name) end
--- * Same as above, but returns the value as a NoiseParams table if the
---   setting `name` exists and is a valid NoiseParams.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5027-L5029)
function core.get_mapgen_setting_noiseparams(name) end
--- * Sets a mapgen param to `value`, and will take effect if the corresponding
---   mapgen setting is not already present in map_meta.txt.
--- * `override_meta` [Optional] is an optional boolean (default: `false`). If this is set
---   to true, the setting will become the active setting regardless of the map
---   metafile contents.
--- * Note: to set the seed, use `"seed"`, not `"fixed_map_seed"`.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5030-L5036)
function core.set_mapgen_setting(name, value, override_meta) end
--- * Same as above, except value is a NoiseParams table.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5037-L5038)
function core.set_mapgen_setting_noiseparams(name, value, override_meta) end
--- * Sets the noiseparams setting of `name` to the noiseparams table specified
---   in `noiseparams`.
--- * `set_default` is an optional boolean (default: `true`) that specifies
---   whether the setting should be applied to the default config or current
---   active config.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5039-L5044)
function core.set_noiseparams(name, noiseparams, set_default) end
--- * Returns a table of the noiseparams for name.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5045-L5046)
function core.get_noiseparams(name) end
--- * Generate all registered ores within the VoxelManip `vm` and in the area
---   from `pos1` to `pos2`.
--- * `pos1` and `pos2` are optional and default to mapchunk minp and maxp.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5047-L5050)
--- @param vm   VoxelManip
--- @param pos1 MapPosition
--- @param pos2 MapPosition
function core.generate_ores(vm, pos1, pos2) end
--- * Generate all registered decorations within the VoxelManip `vm` and in the
---   area from `pos1` to `pos2`.
--- * `pos1` and `pos2` are optional and default to mapchunk minp and maxp.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5051-L5054)
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
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5055-L5062)
function core.clear_objects(options) end
--- * Load the mapblocks containing the area from `pos1` to `pos2`.
---   `pos2` defaults to `pos1` if not specified.
--- * This function does not trigger map generation.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5063-L5066)
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
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5067-L5086)
--- @param pos1 MapPosition
--- @param pos2 MapPosition
function core.emerge_area(pos1, pos2, callback, param) end
--- * delete all mapblocks in the area from pos1 to pos2, inclusive
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5087-L5088)
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
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5089-L5094)
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
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5095-L5100)
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
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5101-L5120)
--- @param pos1 MapPosition
--- @param pos2 MapPosition
function core.find_path(pos1,pos2,searchdistance,max_jump,max_drop,algorithm) end
--- * spawns L-system tree at given `pos` with definition in `treedef` table
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5121-L5122)
--- @param pos MapPosition
function core.spawn_tree (pos, treedef) end
--- * add node to liquid update queue
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5123-L5124)
--- @param pos MapPosition
function core.transforming_liquid_add(pos) end
--- * get max available level for leveled node
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5125-L5126)
--- @param pos MapPosition
function core.get_node_max_level(pos) end
--- * get level of leveled node (water, snow)
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5127-L5128)
--- @param pos MapPosition
function core.get_node_level(pos) end
--- * set level of leveled node, default `level` equals `1`
--- * if `totallevel > maxlevel`, returns rest (`total-max`).
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5129-L5131)
--- @param pos MapPosition
function core.set_node_level(pos, level) end
--- * increase level of leveled node by level, default `level` equals `1`
--- * if `totallevel > maxlevel`, returns rest (`total-max`)
--- * `level` must be between -127 and 127
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5132-L5135)
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
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5136-L5151)
--- @param pos1 MapPosition
--- @param pos2 MapPosition
function core.fix_light(pos1, pos2) end
--- * causes an unsupported `group:falling_node` node to fall and causes an
---   unattached `group:attached_node` node to fall.
--- * does not spread these updates to neighbours.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5152-L5155)
--- @param pos MapPosition
function core.check_single_for_falling(pos) end
--- * causes an unsupported `group:falling_node` node to fall and causes an
---   unattached `group:attached_node` node to fall.
--- * spread these updates to neighbours and can cause a cascade
---   of nodes to fall.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5156-L5160)
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
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5161-L5169)
function core.get_spawn_level(x, z) end

-- Mod channels:
--- * Server joins channel `channel_name`, and creates it if necessary. You
---   should listen for incoming messages with
---   `core.register_on_modchannel_message`
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5176-L5179)
function core.mod_channel_join(channel_name) end

-- Inventory:
--- returns an InvRef
--- * location = e.g.
---		{type="player", name="celeron55"}
---		{type="node", pos={x=, y=, z=}}
---		{type="detached", name="creative"}
--- @return InvRef
function core.get_inventory(location) end
--- Returns
---   an `InvRef`.
--- * `callbacks`: See [Detached inventory callbacks]
--- * `player_name`: Make detached inventory available to one player
---   exclusively, by default they will be sent to every player (even if not
---   used).
---   Note that this parameter is mostly just a workaround and will be removed
---   in future releases.
--- * Creates a detached inventory. If it already exists, it is cleared.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5190-L5198)
--- @param name string
--- @param callbacks DetachedInventoryCallbacksDef
--- @param player_name string
--- @return InvRef
function core.create_detached_inventory(name, callbacks, player_name) end
--- * Returns a `boolean` indicating whether the removal succeeded.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5199-L5200)
function core.remove_detached_inventory(name) end
--- Returns left over ItemStack.
--- * See `core.item_eat` and `core.register_on_item_eat`
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5201-L5203)
function core.do_item_eat(hp_change, replace_with_item, itemstack, user, pointed_thing) end

-- Formspec:
--- @param player_name string name of player to show formspec
--- @param form_name   string name passed to `on_player_receive_fields` callbacks. It should follow the `"modname:<whatever>"` naming convention
--- @param form_spec   string formspec to display (https://api.luanti.org/formspec/)
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5208-L5212)
function core.show_formspec(player_name, form_name, form_spec) end
--- * `playername`: name of player to close formspec
--- * `formname`: has to exactly match the one given in `show_formspec`, or the
---   formspec will not close.
--- * calling `show_formspec(playername, formname, "")` is equal to this
---   expression.
--- * to close a formspec regardless of the formname, call
---   `core.close_formspec(playername, "")`.
---   **USE THIS ONLY WHEN ABSOLUTELY NECESSARY!**
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5213-L5221)
function core.close_formspec(playername, formname) end
--- Returns a string
--- * escapes the characters "[", "]", "\", "," and ";", which can not be used
---   in formspecs.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L3262-L3264)
function core.formspec_escape(string) end
--- Returns a table
--- * returns e.g. `{type="CHG", row=1, column=2}`
--- * `type` is one of:
---     * `"INV"`: no row selected
---     * `"CHG"`: selected
---     * `"DCL"`: double-click
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5225-L5230)
function core.explode_table_event(string) end
--- Returns a table
--- * returns e.g. `{type="CHG", index=1}`
--- * `type` is one of:
---     * `"INV"`: no row selected
---     * `"CHG"`: selected
---     * `"DCL"`: double-click
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5231-L5236)
function core.explode_textlist_event(string) end
--- Returns a table
--- * returns e.g. `{type="CHG", value=500}`
--- * `type` is one of:
---     * `"INV"`: something failed
---     * `"CHG"`: has been changed
---     * `"VAL"`: not changed
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5237-L5242)
function core.explode_scrollbar_event(string) end

-- Item handling:
--- * Returns a string for making an image of a cube (useful as an item image)
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5247-L5248)
function core.inventorycube(img1, img2, img3) end
--- * Returns the position of a `pointed_thing` or `nil` if the `pointed_thing`
---   does not refer to a node or entity.
--- * If the optional `above` parameter is true and the `pointed_thing` refers
---   to a node, then it will return the `above` position of the `pointed_thing`.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5249-L5253)
function core.get_pointed_thing_position(pointed_thing, above) end
--- * Convert a vector to a facedir value, used in `param2` for
---   `paramtype2="facedir"`.
--- * passing something non-`nil`/`false` for the optional second parameter
---   causes it to take the y component into account.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5254-L5258)
function core.dir_to_facedir(dir, is6d) end
--- * Convert a facedir back into a vector aimed directly out the "back" of a
---   node.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5259-L5261)
function core.facedir_to_dir(facedir) end
--- * Convert a vector to a wallmounted value, used for
---   `paramtype2="wallmounted"`.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5262-L5264)
function core.dir_to_wallmounted(dir) end
--- * Convert a wallmounted value back into a vector aimed directly out the
---   "back" of a node.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5265-L5267)
function core.wallmounted_to_dir(wallmounted) end
--- * Convert a vector into a yaw (angle)
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5268-L5269)
function core.dir_to_yaw(dir) end
--- * Convert yaw (angle) to a vector
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5270-L5271)
function core.yaw_to_dir(yaw) end
--- * Returns a boolean. Returns `true` if the given `paramtype2` contains
---   color information (`color`, `colorwallmounted` or `colorfacedir`).
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5272-L5274)
function core.is_colored_paramtype(ptype) end
--- * Removes everything but the color information from the
---   given `param2` value.
--- * Returns `nil` if the given `paramtype2` does not contain color
---   information.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5275-L5279)
function core.strip_param2_color(param2, paramtype2) end
--- * Returns list of itemstrings that are dropped by `node` when dug
---   with `toolname`.
--- * `node`: node as table or node name
--- * `toolname`: name of the tool item (can be `nil`)
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5280-L5284)
function core.get_node_drops(node, toolname) end

--- @class RecipeInput
--- @field method string      `"normal"` or `"cooking"` or `"fuel"`
--- @field width  number      for example `3`
--- @field items  ItemStack[] for example `{stack1, stack2, stack3, stack4, stack 5, stack 6, stack 7, stack 8, stack 9}`

--- @class RecipeOutput
--- @field item         ItemStack
--- @field time         number
--- @field replacements ItemStack[][]

--- Returns `output, decremented_input`
--- * `input.method` = `"normal"` or `"cooking"` or `"fuel"`
--- * `input.width` = for example `3`
--- * `input.items` = for example
---   `{stack1, stack2, stack3, stack4, stack 5, stack 6, stack 7, stack 8, stack 9}`
--- * `output.item` = `ItemStack`, if unsuccessful: empty `ItemStack`
--- * `output.time` = a number, if unsuccessful: `0`
--- * `output.replacements` = List of replacement `ItemStack`s that couldn't be
---   placed in `decremented_input.items`. Replacements can be placed in
---   `decremented_input` if the stack of the replaced item has a count of 1.
--- * `decremented_input` = like `input`
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5285-L5295)
--- @param input RecipeInput
--- @return RecipeOutput, RecipeInput
function core.get_craft_result(input) end
--- Returns input
--- * returns last registered recipe for output item (node)
--- * `output` is a node or item type such as `"default:torch"`
--- * `input.method` = `"normal"` or `"cooking"` or `"fuel"`
--- * `input.width` = for example `3`
--- * `input.items` = for example
---   `{stack1, stack2, stack3, stack4, stack 5, stack 6, stack 7, stack 8, stack 9}`
---     * `input.items` = `nil` if no recipe found
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5296-L5303)
--- @param output string node or item tech name such as `"default:torch"`
--- @return RecipeInput
function core.get_craft_recipe(output) end

--- @class RecipeEntryTable
--- @field method string   'normal' or 'cooking' or 'fuel'
--- @field width  number   0-3, 0 means shapeless recipe
--- @field items  string[] indexed [1-9] table with recipe items
--- @field output string   string with item name and quantity

--- Returns a table or `nil`
--- * returns indexed table with all registered recipes for query item (node)
---   or `nil` if no recipe was found.
--- * recipe entry table:
---     * `method`: 'normal' or 'cooking' or 'fuel'
---     * `width`: 0-3, 0 means shapeless recipe
---     * `items`: indexed [1-9] table with recipe items
---     * `output`: string with item name and quantity
--- * Example query for `"default:gold_ingot"` will return table:
---   ```lua
---       {
---           [1]={method = "cooking", width = 3, output = "default:gold_ingot", items = {1 = "default:gold_lump"}},
---           [2]={method = "normal", width = 1, output = "default:gold_ingot 9", items = {1 = "default:goldblock"}}
---       }
---   ```
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5304-L5319)
---
--- @return RecipeEntryTable[]|nil
function core.get_all_craft_recipes(query_item) end
--- * `drops`: list of itemstrings
--- * Handles drops from nodes after digging: Default action is to put them
---   into digger's inventory.
--- * Can be overridden to get different functionality (e.g. dropping items on
---   ground)
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5320-L5325)
function core.handle_node_drops(pos, drops, digger) end
--- Returns an item
---   string.
--- * Creates an item string which contains palette index information
---   for hardware colorization. You can use the returned string
---   as an output in a craft recipe.
--- * `item`: the item stack which becomes colored. Can be in string,
---   table and native form.
--- * `palette_index`: this index is added to the item stack
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5326-L5333)
function core.itemstring_with_palette(item, palette_index) end
--- Returns an item string
--- * Creates an item string which contains static color information
---   for hardware colorization. Use this method if you wish to colorize
---   an item that does not own a palette. You can use the returned string
---   as an output in a craft recipe.
--- * `item`: the item stack which becomes colored. Can be in string,
---   table and native form.
--- * `colorstring`: the new color of the item stack
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5334-L5341)
function core.itemstring_with_color(item, colorstring) end

-- Rollback:
--- Returns `{{actor, pos, time, oldnode, newnode}, ...}`
--- * Find who has done something to a node, or near a node
--- * `actor`: `"player:<name>"`, also `"liquid"`.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5346-L5349)
function core.rollback_get_node_actions(pos, range, seconds, limit) end
--- Returns
---   `boolean, log_messages`.
--- * Revert latest actions of someone
--- * `actor`: `"player:<name>"`, also `"liquid"`.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5350-L5353)
function core.rollback_revert_actions_by(actor, seconds) end

-- Defaults for the `on_place` and `on_drop` item definition functions:
--- * Place item as a node
--- * `param2` overrides `facedir` and wallmounted `param2`
--- * `prevent_after_place`: if set to `true`, `after_place_node` is not called
---   for the newly placed node to prevent a callback and placement loop
--- * returns `itemstack, position`
---   * `position`: the location the node was placed to. `nil` if nothing was placed.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5358-L5364)
--- @param itemstack           ItemStack
--- @param placer              Player|ObjectRef
--- @param pointed_thing       pointed_thing
--- @param param2              number
--- @param prevent_after_place boolean
--- @return ItemStack, vector|nil
function core.item_place_node(itemstack, placer, pointed_thing, param2, prevent_after_place) end
--- * Place item as-is
--- * returns the leftover itemstack
--- * **Note**: This function is deprecated and will never be called.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5365-L5368)
function core.item_place_object(itemstack, placer, pointed_thing) end
--- * Wrapper that calls `core.item_place_node` if appropriate
--- * Calls `on_rightclick` of `pointed_thing.under` if defined instead
--- * **Note**: is not called when wielded item overrides `on_place`
--- * `param2` overrides facedir and wallmounted `param2`
--- * returns `itemstack, position`
---   * `position`: the location the node was placed to. `nil` if nothing was placed.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5369-L5375)
--- @param itemstack     ItemStack
--- @param placer        Player|ObjectRef|nil
--- @param pointed_thing pointed_thing
--- @param param2?       number
--- @return ItemStack, vector|nil
function core.item_place(itemstack, placer, pointed_thing, param2) end

--- * Runs callbacks registered by `core.register_on_item_pickup` and adds the item to the picker's `"main"` inventory list.
--- * Parameters and return value are the same as `on_pickup`.
--- * **Note**: is not called when wielded item overrides `on_pickup`
--- @param itemstack            ItemStack
--- @param picker               Player|ObjectRef|nil
--- @param pointed_thing        pointed_thing
--- @param time_from_last_punch number
--- @param ...                  any
function core.item_pickup(itemstack, picker, pointed_thing, time_from_last_punch, ...) end
--- * Global secondary use callback. Does nothing.
--- * Parameters and return value are the same as on_secondary_use.
--- * **Note**: is not called when wielded item overrides on_secondary_use
--- @param itemstack   ItemStack
--- @param user Player|ObjectRef|nil
function core.item_secondary_use(itemstack, user) end
--- * Drop the item
--- * returns the leftover itemstack
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5376-L5378)
--- @param itemstack ItemStack
--- @param dropper   Player|ObjectRef|nil
--- @param pos       Position
--- @return ItemStack
function core.item_drop(itemstack, dropper, pos) end
--- * Returns `function(itemstack, user, pointed_thing)` as a
---   function wrapper for `core.do_item_eat`.
--- * `replace_with_item` is the itemstring which is added to the inventory.
---   If the player is eating a stack, then replace_with_item goes to a
---   different spot.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5379-L5384)
function core.item_eat(hp_change, replace_with_item) end

-- Defaults for the `on_punch` and `on_dig` node definition callbacks:
--- * Calls functions registered by `core.register_on_punchnode()`
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5389-L5390)
--- @param pos MapPosition
function core.node_punch(pos, node, puncher, pointed_thing) end
--- * Checks if node can be dug, puts item into inventory, removes node
--- * Calls functions registered by `core.registered_on_dignodes()`
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5391-L5393)
--- @param pos MapPosition
function core.node_dig(pos, node, digger) end

-- Sounds:
--- Returns a handle
--- * `spec` is a `SimpleSoundSpec`
--- * `parameters` is a sound parameter table
--- * `ephemeral` is a boolean (default: false)
---   Ephemeral sounds will not return a handle and can't be stopped or faded.
---   It is recommend to use this for short sounds that happen in response to
---   player actions (e.g. door closing).
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5398-L5404)
function core.sound_play(spec, parameters, ephemeral) end
--- * `handle` is a handle returned by `core.sound_play`
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5405-L5406)
function core.sound_stop(handle) end
--- * `handle` is a handle returned by `core.sound_play`
--- * `step` determines how fast a sound will fade.
---   The gain will change by this much per second,
---   until it reaches the target gain.
---   Note: Older versions used a signed step. This is deprecated, but old
---   code will still work. (the client uses abs(step) to correct it)
--- * `gain` the target gain for the fade.
---   Fading to zero will delete the sound.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5407-L5415)
function core.sound_fade(handle, step, gain) end

--- @class job
local job = {}
-- Timing:
--- Returns job table to use as below.
--- * Call the function `func` after `time` seconds, may be fractional
--- * Optional: Variable number of arguments that are passed to `func`
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5420-L5422)
---@param time number @in seconds
---@param func fun()
---@return job @job (job:cancel() to stop)
function core.after(time, func, ...) end
--- * Cancels the job function from being called
function job:cancel() end

-- Async environment:
--- * Queue the function `func` to be ran in an async environment.
---   Note that there are multiple persistent workers and any of them may
---   end up running a given job. The engine will scale the amount of
---   worker threads automatically.
--- * When `func` returns the callback is called (in the normal environment)
---   with all of the return values as arguments.
--- * Optional: Variable number of arguments that are passed to `func`
--- @since 5.6
function core.handle_async(func, callback, ...) end
--- * Register a path to a Lua file to be imported when an async environment
---   is initialized. You can use this to preload code which you can then call
---   later using `core.handle_async()`.
--- @since 5.6
function core.register_async_dofile(path) end

-- Server:
--- Request for
---   server shutdown. Will display `message` to clients.
--- * `reconnect` == true displays a reconnect button
--- * `delay` adds an optional delay (in seconds) before shutdown.
---   Negative delay cancels the current active shutdown.
---   Zero delay triggers an immediate shutdown.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5430-L5435)
function core.request_shutdown(message,reconnect,delay) end
--- Cancel current delayed shutdown
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5436-L5436)
function core.cancel_shutdown_requests() end
--- * Returns the server status string when a player joins or when the command
---   `/status` is called. Returns `nil` or an empty string when the message is
---   disabled.
--- * `joined`: Boolean value, indicates whether the function was called when
---   a player joined.
--- * This function may be overwritten by mods to customize the status message.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5437-L5443)
function core.get_server_status(name, joined) end
--- Returns the server uptime in seconds
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5444-L5444)
function core.get_server_uptime() end
--- Remove player from database (if they are not
---   connected).
--- * As auth data is not removed, `core.player_exists` will continue to
---   return true. Call the below method as well if you want to remove auth
---   data too.
--- * Returns a code (0: successful, 1: no such player, 2: player is connected)
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5445-L5450)
function core.remove_player(name) end
--- Remove player authentication data
--- * Returns boolean indicating success (false if player nonexistant)
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5451-L5452)
function core.remove_player_auth(name) end
--- * `filepath`: path to a media file on the filesystem
--- * `callback`: function with arguments `name`, where name is a player name
---   (previously there was no callback argument; omitting it is deprecated)
--- * Adds the file to the media sent to clients by the server on startup
---   and also pushes this file to already connected clients.
---   The file must be a supported image, sound or model format. It must not be
---   modified, deleted, moved or renamed after calling this function.
---   The list of dynamically added media is not persisted.
--- * Returns false on error, true if the request was accepted
--- * The given callback will be called for every player as soon as the
---   media is available on the client.
---   Old clients that lack support for this feature will not see the media
---   unless they reconnect to the server. (callback won't be called)
--- * Since media transferred this way currently does not use client caching
---    or HTTP transfers, dynamic media should not be used with big files.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5453-L5468)
function core.dynamic_add_media(filepath, callback) end

-- Bans:
--- Returns a list of all bans formatted as string
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5473-L5473)
function core.get_ban_list() end
--- Returns list of bans matching
---   IP address or name formatted as string
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5474-L5475)
function core.get_ban_description(ip_or_name) end
--- Ban the IP of a currently connected player
--- * Returns boolean indicating success
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5476-L5477)
function core.ban_player(name) end
--- Remove ban record matching
---   IP address or name
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5478-L5479)
function core.unban_player_or_ip(ip_or_name) end
--- Disconnect a player with an optional
---   reason.
--- * Returns boolean indicating success (false if player nonexistant)
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5480-L5482)
function core.kick_player(name, reason) end

-- Particles:
--- * Deprecated: `core.add_particle(pos, velocity, acceleration,
---   expirationtime, size, collisiondetection, texture, playername)`
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5487-L5489)
function core.add_particle(particle_definition) end
--- * Add a `ParticleSpawner`, an object that spawns an amount of particles
---   over `time` seconds.
--- * Returns an `id`, and -1 if adding didn't succeed
--- * Deprecated: `core.add_particlespawner(amount, time,
---   minpos, maxpos,
---   minvel, maxvel,
---   minacc, maxacc,
---   minexptime, maxexptime,
---   minsize, maxsize,
---   collisiondetection, texture, playername)`
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5491-L5501)
function core.add_particlespawner(particlespawner_definition) end
--- * Delete `ParticleSpawner` with `id` (return value from
---   `core.add_particlespawner`).
--- * If playername is specified, only deletes on the player's client,
---   otherwise on all clients.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5503-L5507)
function core.delete_particlespawner(id, player) end

-- Schematics:
--- * Create a schematic from the volume of map specified by the box formed by
---   p1 and p2.
--- * Apply the specified probability and per-node force-place to the specified
---   nodes according to the `probability_list`.
---     * `probability_list` is an array of tables containing two fields, `pos`
---       and `prob`.
---         * `pos` is the 3D vector specifying the absolute coordinates of the
---           node being modified,
---         * `prob` is an integer value from `0` to `255` that encodes
---           probability and per-node force-place. Probability has levels
---           0-127, then 128 may be added to encode per-node force-place.
---           For probability stated as 0-255, divide by 2 and round down to
---           get values 0-127, then add 128 to apply per-node force-place.
---         * If there are two or more entries with the same pos value, the
---           last entry is used.
---         * If `pos` is not inside the box formed by `p1` and `p2`, it is
---           ignored.
---         * If `probability_list` equals `nil`, no probabilities are applied.
--- * Apply the specified probability to the specified horizontal slices
---   according to the `slice_prob_list`.
---     * `slice_prob_list` is an array of tables containing two fields, `ypos`
---       and `prob`.
---         * `ypos` indicates the y position of the slice with a probability
---           applied, the lowest slice being `ypos = 0`.
---         * If slice probability list equals `nil`, no slice probabilities
---           are applied.
--- * Saves schematic in the Minetest Schematic format to filename.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5512-L5539)
function core.create_schematic(p1, p2, probability_list, filename, slice_prob_list) end
--- * Place the schematic specified by schematic (see [Schematic specifier]) at
---   `pos`.
--- * `rotation` can equal `"0"`, `"90"`, `"180"`, `"270"`, or `"random"`.
--- * If the `rotation` parameter is omitted, the schematic is not rotated.
--- * `replacements` = `{["old_name"] = "convert_to", ...}`
--- * `force_placement` is a boolean indicating whether nodes other than `air`
---   and `ignore` are replaced by the schematic.
--- * Returns nil if the schematic could not be loaded.
--- * **Warning**: Once you have loaded a schematic from a file, it will be
---   cached. Future calls will always use the cached version and the
---   replacement list defined for it, regardless of whether the file or the
---   replacement list parameter have changed. The only way to load the file
---   anew is to restart the server.
--- * `flags` is a flag field with the available flags:
---     * place_center_x
---     * place_center_y
---     * place_center_z
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5541-L5558)
function core.place_schematic(pos, schematic, rotation, replacements, force_placement, flags) end
--- * This function is analogous to core.place_schematic, but places a
---   schematic onto the specified VoxelManip object `vmanip` instead of the
---   map.
--- * Returns false if any part of the schematic was cut-off due to the
---   VoxelManip not containing the full area required, and true if the whole
---   schematic was able to fit.
--- * Returns nil if the schematic could not be loaded.
--- * After execution, any external copies of the VoxelManip contents are
---   invalidated.
--- * `flags` is a flag field with the available flags:
---     * place_center_x
---     * place_center_y
---     * place_center_z
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5560-L5573)
function core.place_schematic_on_vmanip(vmanip, pos, schematic, rotation, replacement, force_placement, flags) end
--- * Return the serialized schematic specified by schematic
---   (see [Schematic specifier])
--- * in the `format` of either "mts" or "lua".
--- * "mts" - a string containing the binary MTS data used in the MTS file
---   format.
--- * "lua" - a string containing Lua code representing the schematic in table
---   format.
--- * `options` is a table containing the following optional parameters:
---     * If `lua_use_comments` is true and `format` is "lua", the Lua code
---       generated will have (X, Z) position comments for every X row
---       generated in the schematic data for easier reading.
---     * If `lua_num_indent_spaces` is a nonzero number and `format` is "lua",
---       the Lua code generated will use that number of spaces as indentation
---       instead of a tab character.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5575-L5589)
function core.serialize_schematic(schematic, format, options) end
--- * Returns a Lua table representing the schematic (see: [Schematic specifier])
--- * `schematic` is the schematic to read (see: [Schematic specifier])
--- * `options` is a table containing the following optional parameters:
---     * `write_yslice_prob`: string value:
---         * `none`: no `write_yslice_prob` table is inserted,
---         * `low`: only probabilities that are not 254 or 255 are written in
---           the `write_ylisce_prob` table,
---         * `all`: write all probabilities to the `write_yslice_prob` table.
---         * The default for this option is `all`.
---         * Any invalid value will be interpreted as `all`.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5591-L5601)
function core.read_schematic(schematic, options) end

-- HTTP Requests:
--- * returns `HTTPApiTable` containing http functions if the calling mod has
---   been granted access by being listed in the `secure.http_mods` or
---   `secure.trusted_mods` setting, otherwise returns `nil`.
--- * The returned table contains the functions `fetch`, `fetch_async` and
---   `fetch_async_get` described below.
--- * Only works at init time and must be called from the mod's main scope
---   (not from a function).
--- * Function only exists if minetest server was built with cURL support.
--- * **DO NOT ALLOW ANY OTHER MODS TO ACCESS THE RETURNED TABLE, STORE IT IN
---   A LOCAL VARIABLE!**
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5606-L5616)
---
--- @return HTTPApiTable
function core.request_http_api() end

-- Storage API:
--- * returns reference to mod private `StorageRef`
--- * must be called during mod load time
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5630-L5632)
--- @return StorageRef
function core.get_mod_storage() end

-- Misc.:
--- Returns list of `ObjectRefs`
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5637-L5637)
--- @return Player[]
function core.get_connected_players() end
--- Boolean, whether `obj` is a player
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5638-L5638)
function core.is_player(obj) end
--- Boolean, whether player exists
---   (regardless of online status)
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5639-L5640)
---@param name string
---@return boolean
function core.player_exists(name) end
--- * Replaces definition of a builtin hud element
--- * `name`: `"breath"` or `"health"`
--- * `hud_definition`: definition to replace builtin definition
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5641-L5644)
function core.hud_replace_builtin(name, hud_definition) end
--- * This function can be overridden by mods to change the join message.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5645-L5646)
function core.send_join_message(player_name) end
--- * This function can be overridden by mods to change the leave message.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5647-L5648)
function core.send_leave_message(player_name, timed_out) end
--- Returns an 48-bit integer
--- * `pos`: table {x=number, y=number, z=number},
--- * Gives a unique hash number for a node position (16+16+16=48bit)
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5649-L5651)
function core.hash_node_position(pos) end
--- Returns a position
--- * Inverse transform of `core.hash_node_position`
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5652-L5653)
function core.get_position_from_hash(hash) end
--- Returns a rating
--- * Get rating of a group of an item. (`0` means: not in group)
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5654-L5655)
function core.get_item_group(name, group) end
--- Returns a rating
--- * Deprecated: An alias for the former.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5656-L5657)
function core.get_node_group(name, group) end
--- Returns a rating
--- * Returns rating of the connect_to_raillike group corresponding to name
--- * If name is not yet the name of a connect_to_raillike group, a new group
---   id is created, with that name.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5658-L5661)
function core.raillike_group(name) end
--- Returns an integer
--- * Gets the internal content ID of `name`
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5662-L5663)
--- @param name string
--- @return integer
function core.get_content_id(name) end
--- Returns a string
--- * Gets the name of the content with that content ID
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5664-L5665)
function core.get_name_from_content_id(content_id) end
--- Returns something
--- * Convert a string containing JSON data into the Lua equivalent
--- * `nullvalue`: returned in place of the JSON null; defaults to `nil`
--- * On success returns a table, a string, a number, a boolean or `nullvalue`
--- * On failure outputs an error message and returns `nil`
--- * Example: `parse_json("[10, {\"a\":false}]")`, returns `{10, {a = false}}`
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5666-L5671)
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
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5672-L5685)
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
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5686-L5689)
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
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5690-L5704)
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
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5705-L5712)
function core.compress(data, method, ...) end
--- Returns data
--- * Decompress a string of data (using ZLib).
--- * See documentation on `core.compress()` for supported compression
---   methods.
--- * `...` indicates method-specific arguments. Currently, no methods use this
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5713-L5717)
function core.decompress(compressed_data, method, ...) end
--- Returns a string
--- * Each argument is a 8 Bit unsigned integer
--- * Returns the ColorString from rgb or rgba values
--- * Example: `core.rgba(10, 20, 30, 40)`, returns `"#0A141E28"`
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5718-L5721)
function core.rgba(red, green, blue, alpha) end
--- Returns string encoded in base64
--- * Encodes a string in base64.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5722-L5723)
function core.encode_base64(string) end
--- Returns string or nil for invalid base64
--- * Decodes a string encoded in base64.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5724-L5725)
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
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5726-L5742)
function core.is_protected(pos, name) end
--- * This function calls functions registered with
---   `core.register_on_protection_violation`.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5743-L5745)
function core.record_protection_violation(pos, name) end
--- Returns boolean
--- * Returning `true` means that Creative Mode is enabled for player `name`.
--- * `name` will be `""` for non-players or if the player is unknown.
--- * This function should be overridden by Creative Mode-related mods to
---   implement a per-player Creative Mode.
--- * By default, this function returns `true` if the setting
---   `creative_mode` is `true` and `false` otherwise.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5746-L5752)
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
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5753-L5766)
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
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5767-L5785)
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
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5786-L5789)
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
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5791-L5798)
function core.calculate_knockback(player, hitter, time_from_last_punch,  tool_capabilities, dir, distance, damage) end
--- * forceloads the position `pos`.
--- * returns `true` if area could be forceloaded
--- * If `transient` is `false` or absent, the forceload will be persistent
---   (saved between server runs). If `true`, the forceload will be transient
---   (not saved between server runs).
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5800-L5805)
--- @param pos MapPosition
function core.forceload_block(pos, transient) end
--- * stops forceloading the position `pos`
--- * If `transient` is `false` or absent, frees a persistent forceload.
---   If `true`, frees a transient forceload.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5807-L5810)
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
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5812-L5819)
function core.request_insecure_environment() end
--- * Checks if a global variable has been set, without triggering a warning.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5821-L5822)
function core.global_exists(name) end


--- `EnvRef` of the server environment and world.
--- * Any function in the minetest namespace can be called using the syntax
---   `core.env:somefunction(somearguments)`
---   instead of `core.somefunction(somearguments)`
--- * Deprecated, but support is not to be dropped soon
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5827-L5831)
--- @type table
core.env = {}
--- * Map of registered items, indexed by name
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5838-L5839)
--- @type table<string,ItemDefinition>
core.registered_items = {}
--- * Map of registered node definitions, indexed by name
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5840-L5841)
--- @type table<string,NodeDefinition>
core.registered_nodes = {}
--- * Map of registered craft item definitions, indexed by name
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5842-L5843)
--- @type table
core.registered_craftitems = {}
--- * Map of registered tool definitions, indexed by name
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5844-L5845)
--- @type table
core.registered_tools = {}
--- * Map of registered entity prototypes, indexed by name
--- * Values in this table may be modified directly.
---   Note: changes to initial properties will only affect entities spawned afterwards,
---   as they are only read when spawning.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5846-L5850)
--- @type table|EntityDefinition[]
core.registered_entities = {}
--- * Map of active object references, indexed by object GUID
core.objects_by_guid = {}
--- * **Obsolete**: Use `core.objects_by_guid` instead. GUIDs are strictly more useful than active object IDs.
--- * Map of object references, indexed by active object id
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5851-L5852)
--- @type table
core.object_refs = {}
--- * Map of Lua entities, indexed by active object id
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5853-L5854)
--- @type table
core.luaentities = {}
--- * List of ABM definitions
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5855-L5856)
--- @type table
core.registered_abms = {}
--- * List of LBM definitions
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5857-L5858)
--- @type table
core.registered_lbms = {}
--- * Map of registered aliases, indexed by name
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5859-L5860)
--- @type table
core.registered_aliases = {}
--- * Map of registered ore definitions, indexed by the `name` field.
--- * If `name` is nil, the key is the object handle returned by
---   `core.register_ore`.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5861-L5864)
--- @type table
core.registered_ores = {}
--- * Map of registered biome definitions, indexed by the `name` field.
--- * If `name` is nil, the key is the object handle returned by
---   `core.register_biome`.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5865-L5868)
--- @type table
core.registered_biomes = {}
--- * Map of registered decoration definitions, indexed by the `name` field.
--- * If `name` is nil, the key is the object handle returned by
---   `core.register_decoration`.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5869-L5872)
--- @type table
core.registered_decorations = {}
--- * Map of registered schematic definitions, indexed by the `name` field.
--- * If `name` is nil, the key is the object handle returned by
---   `core.register_schematic`.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5873-L5876)
--- @type table
core.registered_schematics = {}
--- * Map of registered chat command definitions, indexed by name
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5877-L5878)
--- @type table
core.registered_chatcommands = {}
--- * Map of registered privilege definitions, indexed by name
--- * Registered privileges can be modified directly in this table.
---
--- [View in lua_api.txt](https://github.com/minetest/minetest/blob/5.4.1/doc/lua_api.txt#L5879-L5881)
--- @type table
core.registered_privileges = {}



--
-- Built-in libraries and extensions
--

--- @param obj     any
--- @param dumped? table
--- @return string
function dump(obj, dumped) end

--
-- Non-existent mods
--
dungeon_loot = nil
invisibility = nil

---
--- Implementation-specific Lua libraries
---

--- LuaJIT support library
--- https://luajit.org/ext_jit.html
jit = {}

--- Legacy function, should be removed after upgrading to 5.5
--- @deprecated
function spawn_falling_node(pos, nodename) end
