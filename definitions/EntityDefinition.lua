--- @meta


--- Used by `core.register_entity`.
--- The entity definition table becomes a metatable of a newly created per-entity luaentity table,
---   meaning its fields (e.g. initial_properties) will be shared between all instances of an entity.
---
--- `T` is the type of `self` in callbacks (the spawned `LuaEntity`).
--- To get your own fields typed in `self`, describe your entity as a class inherited from `LuaEntity<YourClass>`:
--- ```lua
--- --- @class mymod.Entity: LuaEntity<mymod.Entity>
--- --- @field _timer number
--- local Entity = {
---     _timer = 0,
---     on_step = function(self, dtime)
---         self._timer = self._timer + dtime
---     end,
--- }
--- core.register_entity("mymod:entity", Entity)
--- ```
--- @class EntityDefinition<T: LuaEntity<T> = LuaEntity<any>>
local EntityDefinition = {
	--- A table of object properties, see the `Object properties` section.
	--- The properties in this table are applied to the object
	---	once when it is spawned.
	--- @type ObjectProperties?
	initial_properties = nil,


	--- Called when the object is instantiated.
	--- * `staticdata`: string from `get_staticdata()` (or the one passed to `core.add_entity()`)
	--- * `dtime_s`: time passed since the object was unloaded, which can be used for updating the entity state.
	--- @type fun(self:T, staticdata:string, dtime_s:integer)?
	on_activate = nil,
	--- * Called when the object is about to get removed or unloaded.
	--- * `removal`: boolean indicating whether the object is about to get removed.
	---   Calling `object:remove()` on an active object will call this with `removal=true`.
	---   The mapblock the entity resides in being unloaded will call this with `removal=false`.
	--- * Note that this won't be called if the object hasn't been activated in the first place.
	---   In particular, `core.clear_objects({mode = "full"})` won't call this,
	---   whereas `core.clear_objects({mode = "quick"})` might call this.
	--- @type fun(self:T, removal:boolean)?
	on_deactivate = nil,
	--- * Called on every server tick, after movement and collision processing.
	--- * `dtime`: elapsed time since last call
	--- * `moveresult`: table with collision info (only available if physical=true)
	--- @type fun(self:T, dtime:number, moveresult:table?)?
	on_step = nil,

	--- * Called when somebody punches the object.
	--- * Note that you probably want to handle most punches using the automatic armor group system.
	--- * `puncher`: an `ObjectRef` (can be `nil`)
	--- * `time_from_last_punch`: Meant for disallowing spamming of clicks (can be `nil`).
	--- * `tool_capabilities`: capability table of used item
	--- * `dir`: unit vector of direction of punch. Always defined. Points from the puncher to the punched.
	--- * `damage`: damage that will be done to entity.
	--- * Can return `true` to prevent the default damage mechanism.
	--- @type (fun(self:T, puncher:ObjectRef|Player|nil, time_from_last_punch:number|nil, tool_capabilities:table, dir:vector, damage:number):boolean?)?
	on_punch = nil,
	--- * Called when the object dies.
	--- * `killer`: an `ObjectRef` (can be `nil`)
	--- @type fun(self:T, killer:ObjectRef|Player|nil)?
	on_death = nil,
	--- * Called when `clicker` pressed the 'place/use' key while pointing
	---   to the object (not necessarily an actual rightclick)
	--- * `clicker`: an `ObjectRef` (may or may not be a player)
	--- @type fun(self:T, clicker:ObjectRef|Player)?
	on_rightclick = nil,
	--- * Called after another object is attached to this object.
	--- * `child`: an `ObjectRef` of the child
	--- @type fun(self:T, child:ObjectRef)?
	on_attach_child = nil,
	--- * Called after another object has detached from this object.
	--- * `child`: an `ObjectRef` of the child
	--- @type fun(self:T, child:ObjectRef)?
	on_detach_child = nil,
	--- * Called after detaching from another object.
	--- * `parent`: an `ObjectRef` from where it got detached
	--- * Note: this is also called before removal from the world.
	--- @type fun(self:T, parent:ObjectRef)?
	on_detach = nil,
	--- * Should return a string that will be passed to `on_activate` when the object is instantiated the next time.
	--- @type (fun(self:T):string)?
	get_staticdata = nil,

	--- You can define arbitrary member variables here (see Item definition for more info) by using a '_' prefix
	--- @type any
	_custom_field = "whatever",
}


--- Definition of an already registered entity (`core.registered_entities`).
--- `core.register_entity()` adds these fields to the passed definition table itself
--- and sets `__index` to itself, so it becomes the metatable of each spawned `LuaEntity`.
--- @class RegisteredEntityDefinition<T: LuaEntity<T> = LuaEntity<any>>: EntityDefinition<T>
--- @field name       string registered name (`"mod:thing"`)
--- @field mod_origin string name of the mod that registered the entity
