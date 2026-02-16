--- @meta

--- Moving things in the game are generally these.
--- This is basically a reference to a C++ ServerActiveObject.
--- @class ObjectRef
ObjectRef = {}

--- Returns whether the object is valid.
function ObjectRef:is_valid() end

--- Returns position as vector `{x=num, y=num, z=num}`
--- @return vector
function ObjectRef:get_pos() end

--- Sets the position of the object.
---
--- No-op if object is attached
--- @param pos Position is a vector `{x=num, y=num, z=num}`
function ObjectRef:set_pos(pos) end

--- Changes position by adding to the current position.
---
--- No-op if object is attached.
---
--- In comparison to using `set_pos`, `add_pos` will avoid synchronization problems.
--- @param pos Position is a vector `{x=num, y=num, z=num}`.
function ObjectRef:add_pos(pos) end

--- Returns the velocity, a vector.
--- @return vector
function ObjectRef:get_velocity()  end

--- Changes velocity by adding to the current velocity.
---
--- In comparison to using `get_velocity`, adding the velocity and then using
--- `set_velocity`, `add_velocity` is supposed to avoid synchronization problems.
---
--- Additionally, players also do not support set_velocity.
---
--- If a player:
--- * Does not apply during `free_move`.
--- * Note that since the player speed is normalized at each move step,
---   increasing e.g. Y velocity beyond what would usually be achieved
---   (see: physics overrides) will cause existing X/Z velocity to be reduced.
--- * Example: `add_velocity({x=0, y=6.5, z=0})` is equivalent to
---   pressing the jump key (assuming default settings)
--- @param vel Position is a vector e.g. `{x=0.0, y=2.3, z=1.0}`
function ObjectRef:add_velocity(vel) end

--- Does an interpolated move for Lua entities for visually smooth transitions.
---
--- If `continuous` is true (default: false), the Lua entity will not be moved to the current
--- position before starting the interpolated move.
---
--- For players this does the same as `set_pos`,`continuous` is ignored.
---
--- No-op if object is attached.
--- @overload fun(pos)
--- @param pos        Position
--- @param continuous boolean
function ObjectRef:move_to(pos, continuous) end

--- Punches the object, triggering all consequences a normal punch would have.
---
--- Arguments `time_from_last_punch`, `tool_capabilities`, and `direction` will be replaced
--- with a default value when the caller sets them to `nil`.
---
--- Other arguments: See on_punch for entities
--- @param puncher?              ObjectRef|Entity|Player|nil another `ObjectRef` which punched the object (can be `nil`)
--- @param time_from_last_punch? number                      Meant for disallowing spamming of clicks (can be `nil`)
--- @param tool_capabilities?    table                       capability table of used item. See [Tool Capabilities](https://api.luanti.org/tool-capabilities/)
--- @param direction?            Position                    direction vector. Points from the puncher to the punched (can be nil)
function ObjectRef:punch(puncher, time_from_last_punch, tool_capabilities, direction) end

--- Simulates using the 'place/use' key on the object
---
--- Triggers all consequences as if a real player had done this
---
--- Note: this is called `right_click`` for historical reasons only
--- @param clicker ObjectRef is another `ObjectRef` which has clicked
function ObjectRef:right_click(clicker) end

--- Returns number of health points
--- @return number
function ObjectRef:get_hp() end

--- Set number of health points
---  * See reason in `register_on_player_hpchange`
---  * Is limited to the range of 0 ... 65535 (2^16 - 1)
---  * For players: HP are also limited by `hp_max` specified in object properties
--- @param hp     number
--- @param reason PlayerHPChangeReason
function ObjectRef:set_hp(hp, reason) end

--- Returns an `InvRef` for players, otherwise returns `nil`
--- @return InvRef|nil
function ObjectRef:get_inventory() end

--- Returns the name of the inventory list the wielded item is in.
--- @return string
function ObjectRef:get_wield_list() end

--- returns the wield list index of the wielded item (starting with 1)
--- @return number
function ObjectRef:get_wield_index() end

--- Returns a copy of the wielded item as an `ItemStack`
--- @return ItemStack
function ObjectRef:get_wielded_item() end

--- Replaces the wielded item, returns `true` if successful.
--- @param item ItemStack
--- @return boolean
function ObjectRef:set_wielded_item(item) end

--- Returns a table with all of the object's armor group ratings
---
--- Syntax: the table keys are the armor group names,
--- the table values are the corresponding group ratings
---
--- See section [ObjectRef armor groups](https://api.luanti.org/groups/#objectref-armor-groups) for details
--- @return table<string,number>
function ObjectRef:get_armor_groups() end

--- Sets the object's full list of armor groups
---
--- Same table syntax as for `get_armor_groups`
---
--- Note: all armor groups not in the table will be removed
--- @param groups table `{group1=rating, group2=rating, ...}`
function ObjectRef:set_armor_groups(groups) end

--- Sets the object animation parameters and (re)starts the animation
---
--- Animations only work with a `"mesh"` visual
---
--- Animation interpolates towards the end frame but stops when it is reached
--- * If looped, there is no interpolation back to the start frame
--- * If looped, the model should look identical at start and end
--- @param frame_range table Beginning and end frame (as specified in the mesh file). Syntax: `{x=start_frame, y=end_frame}`. Default: `{x=1.0, y=1.0}`
--- @param frame_speed number How fast the animation plays, in frames per second (number). Default: `15.0`
--- @param frame_blend number Default: `0.0`
--- @param frame_loop boolean  If true, animation will loop. If false, it will play once. Default: `true`
function ObjectRef:set_animation(frame_range, frame_speed, frame_blend, frame_loop) end

--- Returns current animation parameters set by `set_animation`:
--- * `frame_range`
--- * `frame_speed`
--- * `frame_blend`
--- * `frame_loop`
--- @return table,number,number,boolean
function ObjectRef:get_animation() end

--- Sets the frame speed of the object's animation
---
--- Unlike `set_animation`, this will not restart the animation
---
--- `frame_speed`: See `set_animation`.
--- @param frame_speed number Default: `15.0`
function ObjectRef:set_animation_frame_speed(frame_speed) end

--- Attaches object to `parent`.
---
--- See 'Attachments' section for details.
---
--- This command may fail silently (do nothing) when it would result in circular attachments.
--- @overload fun(parent:ObjectRef)
--- @param parent         ObjectRef       to attach to
--- @param bone           string          default `""` (the root bone)
--- @param position       Position        relative position, default `{x=0, y=0, z=0}`
--- @param rotation       Position|vector relative rotation in degrees, default `{x=0, y=0, z=0}`
--- @param forced_visible boolean         to control whether the attached entity should appear in first person, default `false`.
function ObjectRef:set_attach(parent, bone, position, rotation, forced_visible) end

--- Returns current attachment parameters or nil if it isn't attached.
---
--- If attached, returns `parent`, `bone`, `position`, `rotation`, `forced_visible`.
--- @return ObjectRef,string,Position,Position,boolean|nil
function ObjectRef:get_attach() end

--- Returns a list of ObjectRefs that are attached to the object.
--- @return ObjectRef[]
function ObjectRef:get_children() end

--- Detaches object. No-op if object was not attached.
function ObjectRef:set_detach() end

--- Sets absolute bone overrides, e.g. it is equivalent to
--- ```
--- obj:set_bone_override(bone, {
---     position = {vec = position, absolute = true},
---     rotation = {vec = rotation:apply(math.rad), absolute = true}
--- })
--- ```
--- **Note**: Rotation is in degrees, not radians.
---
--- **Deprecated**: Use `set_bone_override` instead.
--- @deprecated
--- @param bone?     string   Default is `""`, the root bone
--- @param position? Position `{x=num, y=num, z=num}`, relative, `default {x=0, y=0, z=0}`
--- @param rotation? Position `{x=num, y=num, z=num}`, default `{x=0, y=0, z=0}`
function ObjectRef:set_bone_position(bone, position, rotation) end

--- Returns the previously set position and rotation of the bone.
---
--- Shorthand for `get_bone_override(bone).position.vec, get_bone_override(bone).rotation.vec:apply(math.deg)`.
---
--- **Note:** Returned rotation is in degrees, not radians.
---
--- **Deprecated:** Use `get_bone_override` instead.
--- @deprecated
--- @param bone string
--- @return Position,Position
function ObjectRef:get_bone_position(bone) end

---@alias property { vec:vector, interpolation:number, absolute:boolean }

--- `override = nil` (including omission) is shorthand for `override = {}` which clears the override.
---
--- Each `property` is a table of the form `{ vec = vector, interpolation = 0, absolute = false }` or `nil`
--- * `vec` is in the same coordinate system as the model, and in radians for rotation.
---   It defaults to `vector.zero()` for translation and rotation and `vector.new(1, 1, 1)` for scale.
--- * `interpolation`: The old and new overrides are interpolated over this timeframe (in seconds).
--- * `absolute`: If set to `false` (which is the default), the override will be relative to the animated property:
--- * Translation in the case of `position`;
--- * Composition in the case of `rotation`;
--- * Per-axis multiplication in the case of `scale`
---
--- `property = nil` is equivalent to no override on that property.
---
--- **Note**: Unlike set_bone_position, the rotation is in radians, not degrees.
---
--- Compatibility note: Clients prior to 5.9.0 only support absolute position and rotation.
---
--- All values are treated as absolute and are set immediately (no interpolation).
--- @param bone string
--- @param override { position:property?, rotation:property?, scale:property? }?
function ObjectRef:set_bone_override(bone, override) end

--- Returns `override` in the above format
---
--- **Note**: Unlike get_bone_position, the returned rotation is in radians, not degrees.
--- @return {position:property, rotation:property, scale:property}
function ObjectRef:get_bone_override(bone) end

--- Returns all bone overrides as table `{[bonename] = override, ...}`.
--- @return table<string,{position:property, rotation:property, scale:property}>
function ObjectRef:get_bone_overrides() end

--- @param object_property_table ObjectProperties
function ObjectRef:set_properties(object_property_table) end

--- Returns a table of all object properties
--- @return ObjectProperties
function ObjectRef:get_properties() end

--- Sets observers (players this object is sent to)
---
--- If observers is nil, the object's observers are "unmanaged":
--- The object is sent to all players as governed by server settings. This is the default.
---
--- Attachments: The effective observers of an object are made up of all players who can observe the object
--- and are also effective observers of its parent object (if there is one).
---
--- Players are automatically added to their own observer sets. Players must effectively observe themselves.
---
--- Object activation and deactivation are unaffected by observability.
---
--- Attached sounds do not work correctly and thus should not be used on objects with managed observers yet.
--- @param observers table<string,boolean> is a "set" of player names: `{name1 = true, name2 = true, ...}`.
--- A set is a table where the keys are the elements of the set (in this case, valid player names) and the values are all true.
function ObjectRef:set_observers(observers) end

--- Throws an error if the object is invalid
--- * returns nil if the observers are unmanaged
--- * returns a table with all observer names as keys and true values (a "set") otherwise
--- @return table<string, boolean>
function ObjectRef:get_observers() end

--- Like `get_observers()`, but returns the "effective" observers, taking into account attachments
---
--- Time complexity: O(nm)
--- * n: number of observers of the involved entities
--- * m: number of ancestors along the attachment chain
--- @return table<string, boolean>
function ObjectRef:get_effective_observers() end

--- Returns `true` for players, `false` otherwise
--- @return boolean
function ObjectRef:is_player() end

--- Returns a table with the attributes of the nametag of an object
---
--- A nametag is a HUD text rendered above the object
---
--- Example:
--- ```
--- {
---    text = "",
---    color = {a=0..255, r=0..255, g=0..255, b=0..255},
---    bgcolor = {a=0..255, r=0..255, g=0..255, b=0..255},
--- }
--- ```
--- @return {text:string, color:colorSpec, bgcolor:ColorSpec}
function ObjectRef:get_nametag_attributes() end

--- Sets the attributes of the nametag of an object.
---
--- `attributes`:
--- ```{
---     text = "My Nametag",
---     color = ColorSpec,
---     -- ^ Text color
---     bgcolor = ColorSpec or false,
---     -- ^ Sets background color of nametag
---     -- `false` will cause the background to be set
---     -- automatically based on user settings
---     -- Default: false
--- }
--- ```
--- @param attributes table
function ObjectRef:set_nametag_attributes(attributes) end

--- Returns a global unique identifier (a string)
---
--- * For players, this is a player name.
--- * For Lua entities, this is a uniquely generated string, guaranteed not to collide with player names.
---
--- example: `@bGh3p2AbRE29Mb4biqX6OA`
---
--- GUIDs only use printable ASCII characters.
--- GUIDs persist between object reloads, and their format is guaranteed not to change.
---
--- Thus you can use the GUID to identify an object in a particular world online and offline.
--- @return string
function ObjectRef:get_guid()
