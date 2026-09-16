--- @meta

-- -----------------------------------------
-- # Global callback registration functions:
-- -----------------------------------------

--- * Called every server step, usually interval of 0.1s
--- * `delta_time` is the time since last execution in seconds.
---
--- @param callback fun(delta_time:number)
function core.register_globalstep(callback) end

--- * Called after mods have finished loading and before the media is cached or the
---   aliases handled.
---
--- @param callback fun()
function core.register_on_mods_loaded(callback) end

--- * Called before server shutdown
--- * **Warning**: If the server terminates abnormally (i.e. crashes), the
---   registered callbacks **will likely not be run**. Data should be saved at
---   semi-frequent intervals as well as on server shutdown.
---
--- @param callback fun()
function core.register_on_shutdown(callback) end

--- * Called when a node has been placed
--- * If return `true` no item is taken from `itemstack`
--- * `placer` may be any valid ObjectRef or nil.
--- * **Not recommended**; use `on_construct` or `after_place_node` in node
---   definition whenever possible.
---
--- @param callback fun(pos, newnode, placer, oldnode, itemstack, pointed_thing)
function core.register_on_placenode(callback) end

--- * Called when a node has been dug.
--- * **Not recommended**; Use `on_destruct` or `after_dig_node` in node
---   definition whenever possible.
---
--- @param callback fun(pos, oldnode, digger)
function core.register_on_dignode(callback) end

--- * Called when a node is punched
---
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
--- @overload fun(callback:fun(vmanip:VoxelManip, min_pos:MapVector, max_pos:MapVector, blockseed:number))
--- @param callback fun(min_pos:MapVector, max_pos:MapVector, blockseed:number)
function core.register_on_generated(callback) end

--- * Called when a new player enters the world for the first time
---
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
--- @param callback fun(player:Player, hitter:Player, time_from_last_punch:number|nil, tool_capabilities, dir, damage)
function core.register_on_punchplayer(callback) end

--- * Called when a player is right-clicked
--- * `player`: ObjectRef - Player that was right-clicked
--- * `clicker`: ObjectRef - Object that right-clicked, may or may not be a player
---
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
--- @field node_pos MapVector|nil

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
--- @param callback fun(player:Player, hp_change:number, reason:PlayerHPChangeReason)|fun(player:Player, hp_change:number, reason:PlayerHPChangeReason):number,boolean
--- @param modifier boolean
function core.register_on_player_hpchange(callback, modifier) end

--- * Called when a player dies
--- * `reason`: a PlayerHPChangeReason table, see register_on_player_hpchange
---
--- @param callback fun(player:ObjectRef, reason:PlayerHPChangeReason)
function core.register_on_dieplayer(callback) end

--- * Called when player is to be respawned
--- * Called _before_ repositioning of player occurs
--- * return true in func to disable regular player placement
---
--- @param callback fun(player:ObjectRef):boolean|nil
function core.register_on_respawnplayer(callback) end

--- * Called when a client connects to the server, prior to authentication
--- * If it returns a string, the client is disconnected with that string as
---   reason.
---
--- @param callback fun(name:string, ip:string):nil|string
function core.register_on_prejoinplayer(callback) end

--- * Called when a player joins the game
--- * `last_login`: The timestamp of the previous login, or nil if player is new
---
--- @param callback fun(player:Player, last_login:number)
function core.register_on_joinplayer(callback) end

--- * Called when a player leaves the game
--- * `timed_out`: True for timeout, false for other reasons.
---
--- @param callback fun(player:Player, timed_out:boolean)
function core.register_on_leaveplayer(callback) end

--- * Called when a client attempts to log into an account.
--- * `name`: The name of the account being authenticated.
--- * `ip`: The IP address of the client
--- * `is_success`: Whether the client was successfully authenticated
--- * For newly registered accounts, `is_success` will always be true
---
--- @param callback fun(name, ip, is_success)
function core.register_on_authplayer(callback) end

--- * Deprecated: use `core.register_on_authplayer(name, ip, is_success)` instead.
---
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
--- @param callback fun(ObjectRef, cheat)
function core.register_on_cheat(callback) end

--- * Called always when a player says something
--- * Return `true` to mark the message as handled, which means that it will
---   not be sent to other players.
---
--- @param callback fun(name, message)
function core.register_on_chat_message(callback) end

--- * Called always when a chatcommand is triggered, before `core.registered_chatcommands`
---   is checked to see if the command exists, but after the input is parsed.
--- * Return `true` to mark the command as handled, which means that the default
---   handlers will be prevented.
---
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
--- @param callback fun(itemstack, player, old_craft_grid, craft_inv)
function core.register_on_craft(callback) end

--- * The same as before, except that it is called before the player crafts, to
---   make craft prediction, and it should not change anything.
---
--- @param callback fun(itemstack, player, old_craft_grid, craft_inv)
function core.register_craft_predict(callback) end

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
--- @param callback fun(player:ObjectRef|Player, action:"move"|"put"|"take", inventory:InvRef, inventory_info:table):integer?
function core.register_allow_player_inventory_action(callback) end

--- * Called after a take, put or move event from/to/in a player inventory
--- * Function arguments: see `core.register_allow_player_inventory_action`
--- * Does not accept or handle any return value.
---
--- @param callback fun(player:ObjectRef|Player, action:"move"|"put"|"take", inventory:InvRef, inventory_info:table):integer?
function core.register_on_player_inventory_action(callback) end

--- * Called by `builtin` and mods when a player violates protection at a
---   position (eg, digs a node or punches a protected entity).
--- * The registered functions can be called using
---   `core.record_protection_violation`.
--- * The provided function should check that the position is protected by the
---   mod calling this function before it prints a message, if it does, to
---   allow for multiple protection mods.
---
--- @param callback fun(pos, name)
function core.register_on_protection_violation(callback) end

--- * Called when an item is eaten, by `core.item_eat`
--- * Return `itemstack` to cancel the default item eat response (i.e.: hp increase).
---
--- @param callback fun(hp_change, replace_with_item, itemstack, user, pointed_thing)
function core.register_on_item_eat(callback) end

--- * Called when `granter` grants the priv `priv` to `name`.
--- * Note that the callback will be called twice if it's done by a player,
---   once with granter being the player name, and again with granter being nil.
---
--- @param callback fun(name, granter, priv)
function core.register_on_priv_grant(callback) end

--- * Called when `revoker` revokes the priv `priv` from `name`.
--- * Note that the callback will be called twice if it's done by a player,
---   once with revoker being the player name, and again with revoker being nil.
---
--- @param callback fun(name, revoker, priv)
function core.register_on_priv_revoke(callback) end

--- * Called when `name` user connects with `ip`.
--- * Return `true` to by pass the player limit
---
--- @param callback fun(name, ip)
function core.register_can_bypass_userlimit(callback) end

--- * Called when an incoming mod channel message is received
--- * You should have joined some channels to receive events.
--- * If message comes from a server mod, `sender` field is an empty string.
---
--- @param callback fun(channel_name, sender, message)
function core.register_on_modchannel_message(callback) end
