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
--- @deprecated
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
--   see ./core_namespace/logging.lua


-- Registration functions:
--   Environment:
--     see ./core_namespace/registration/environment.lua
--   Gameplay:
--     see ./core_namespace/registration/gameplay.lua
--   Global callback registration functions:
--     see ./core_namespace/registration/global.lua

-- Setting-related:
--   see ./core_namespace/settings.lua

-- Authentication:
--   see ./core_namespace/authentication.lua

-- Chat:
--   see ./core_namespace/chat.lua

-- Environment access:
--   see ./core_namespace/environment_access.lua

-- Mod channels:
--   see ./core_namespace/mod_channels.lua

-- Inventory:
--   see ./core_namespace/inventory.lua

-- Formspec:
--   see ./core_namespace/formspec.lua

-- Item handling:
--   see ./core_namespace/item_handling.lua


-- Rollback:
--   see ./core_namespace/rollback.lua

-- Defaults for the `on_place` and `on_drop` item definition functions:
--   see ./core_namespace/defaults_for_items.lua

-- Defaults for the `on_punch` and `on_dig` node definition callbacks:
--   see ./core_namespace/defaults_for_nodes.lua

-- Sounds:
--   see ./core_namespace/sounds.lua

-- Timing:
--   see ./core_namespace/timing.lua

-- Async environment:
--   see ./core_namespace/async_environment.lua

-- Server:
--   see ./core_namespace/server.lua

-- Bans:
--   see ./core_namespace/bans.lua

-- Particles:
--   see ./core_namespace/particles.lua

-- Schematics:
--   see ./core_namespace/schematics.lua

-- HTTP Requests:
--   see ./core_namespace/http_requests.lua

-- Storage API:
--   see ./core_namespace/storage_api.lua

-- Misc.:
--   see ./core_namespace/misc.lua

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
--- @type table<string,RegisteredNodeDefinition>
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
