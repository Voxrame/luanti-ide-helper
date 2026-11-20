--- @meta


--- Lua entity (the `self` in `EntityDefinition` callbacks; `core.luaentities[id]`).
--- Created by the engine on each spawn: a new table with the `RegisteredEntityDefinition`
--- as its metatable, so all fields of the definition are visible through it.
--- @class LuaEntity<T:self = LuaEntity<any>>: RegisteredEntityDefinition<T>
--- @field name   string registered name (`"mod:thing"`); duplicated from `RegisteredEntityDefinition` for LuaLS
--- @field object Entity
LuaEntity = {

}
