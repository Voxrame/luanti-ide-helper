--- @meta

-- ----------------
-- # Global tables:
-- ----------------


--- * Map of registered items, indexed by name
---
--- @type table<string,ItemDefinition>
core.registered_items = {}
--- * Map of registered node definitions, indexed by name
---
--- @type table<string,RegisteredNodeDefinition>
core.registered_nodes = {}
--- * Map of registered craft item definitions, indexed by name
---
--- @type table
core.registered_craftitems = {}
--- * Map of registered tool definitions, indexed by name
---
--- @type table
core.registered_tools = {}
--- * Map of registered entity prototypes, indexed by name
--- * Values in this table may be modified directly.
---   Note: changes to initial properties will only affect entities spawned afterwards,
---   as they are only read when spawning.
---
--- @type table|EntityDefinition[]
core.registered_entities = {}
--- * Map of active object references, indexed by object GUID
core.objects_by_guid = {}
--- * **Obsolete**: Use `core.objects_by_guid` instead. GUIDs are strictly more useful than active object IDs.
--- * Map of object references, indexed by active object id
---
--- @type table
core.object_refs = {}
--- * Map of Lua entities, indexed by active object id
---
--- @type table
core.luaentities = {}
--- * List of ABM definitions
---
--- @type table
core.registered_abms = {}
--- * List of LBM definitions
---
--- @type table
core.registered_lbms = {}
--- * Map of registered aliases, indexed by name
---
--- @type table
core.registered_aliases = {}
--- * Map of registered ore definitions, indexed by the `name` field.
--- * If `name` is nil, the key is the object handle returned by
---   `core.register_ore`.
---
--- @type table
core.registered_ores = {}
--- * Map of registered biome definitions, indexed by the `name` field.
--- * If `name` is nil, the key is the object handle returned by
---   `core.register_biome`.
---
--- @type table
core.registered_biomes = {}
--- * Map of registered decoration definitions, indexed by the `name` field.
--- * If `name` is nil, the key is the object handle returned by
---   `core.register_decoration`.
---
--- @type table
core.registered_decorations = {}
--- * Map of registered schematic definitions, indexed by the `name` field.
--- * If `name` is nil, the key is the object handle returned by
---   `core.register_schematic`.
---
--- @type table
core.registered_schematics = {}
--- * Map of registered chat command definitions, indexed by name
---
--- @type table
core.registered_chatcommands = {}
--- * Map of registered privilege definitions, indexed by name
--- * Registered privileges can be modified directly in this table.
---
--- @type table
core.registered_privileges = {}
