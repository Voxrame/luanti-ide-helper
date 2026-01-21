--- @meta


--- * register a node with its definition
--- * Note: you must pass a clean table that hasn't already been used for another registration to this function, as it will be modified.
--- @param name            string         technical node name ("<mod>:<node>").
--- @param node_definition NodeDefinition table with node definition properties.
function core.register_node(name, node_definition) end


--- * register an item with its definition
--- * Note: you must pass a clean table that hasn't already been used for another registration to this function, as it will be modified.
--- @param name            string         technical item name ("<mod>:<item>").
--- @param item_definition ItemDefinition table with item definition properties.
function core.register_craftitem(name, item_definition) end

--- * register a tool item with its definition
--- * Note: you must pass a clean table that hasn't already been used for another registration to this function, as it will be modified.
--- @param name            string
--- @param item_definition ItemDefinition
function core.register_tool(name, item_definition) end

--- Overrides fields of an item registered with register_node/tool/craftitem.
--- * `redefinition` is a table of fields `[name] = new_value`, overwriting fields of or adding fields to the existing definition.
--- * Note: Item must already be defined, (opt)depend on the mod defining it.
--- * Example: `core.override_item("default:mese", { light_source = core.LIGHT_MAX }, { "sounds" })`:
---   Overwrites the `light_source` field, removes the `sounds` from the definition of the mese block.
---
--- @param name         string
--- @param redefinition ItemDefinition|NodeDefinition
function core.override_item(name, redefinition) end

--- Unregisters the item from the engine, and deletes the entry with key
---   `name` from `core.registered_items` and from the associated item table
---   according to its nature (e.g. `core.registered_nodes`)
---
--- @param name string
function core.unregister_item(name) end

--- @param name string
--- @param entity_definition EntityDefinition
function core.register_entity(name, entity_definition) end

--- @param abm_definition ABMDefinition
function core.register_abm(abm_definition) end

--- @param lbm_definition LBMDefinition
function core.register_lbm(lbm_definition) end

--- * Also use this to set the 'mapgen aliases' needed in a game for the core
---   mapgens. See [Mapgen aliases](https://api.luanti.org/aliases/#mapgen-aliases) section.
---
--- @param alias         string @itemstring (`"<mod>:<node>"`). For renaming: its old name.
--- @param original_name string @itemstring (`"<mod>:<node>"`). For renaming: its new name.
function core.register_alias(alias, original_name) end

--- * Forces an alias to be created, even if an alias with the same name
---   already exists.
--- @param alias         string @itemstring (`"<mod>:<node>"`). For renaming: its old name.
--- @param original_name string @itemstring (`"<mod>:<node>"`). For renaming: its new name.
function core.register_alias_force(alias, original_name) end

--- * Returns an integer object handle uniquely identifying the registered ore on success.
--- * The order of ore registrations determines the order of ore generation.
---
--- @param ore_definition OreDefinition
--- @return integer
function core.register_ore(ore_definition) end

--- * Returns an integer object handle uniquely identifying the registered
---   biome on success. To get the biome ID, use `core.get_biome_id`.
---
--- @param biome_definition BiomeDefinition
--- @return integer
function core.register_biome(biome_definition) end

--- * Unregisters the biome from the engine, and deletes the entry with key
---   `name` from `core.registered_biomes`.
--- * Warning: This alters the biome to biome ID correspondences, so any
---   decorations or ores using the 'biomes' field must afterwards be cleared
---   and re-registered.
---
--- @param name string
function core.unregister_biome(name) end

--- * Returns an integer object handle uniquely identifying the registered
---   decoration on success. To get the decoration ID, use
---   `core.get_decoration_id`.
--- * The order of decoration registrations determines the order of decoration
---   generation.
---
--- @param decoration_definition DecorationDefinition
--- @return integer
function core.register_decoration(decoration_definition) end

--- * Returns an integer object handle uniquely identifying the registered
---   schematic on success.
--- * If the schematic is loaded from a file, the `name` field is set to the
---   filename.
--- * If the function is called when loading the mod, and `name` is a relative
---   path, then the current mod path will be prepended to the schematic
---   filename.
---
--- @param schematic     SchematicSpecifier|string
--- @param replacements? table?
--- @return integer
function core.register_schematic(schematic, replacements) end

--- * Clears all biomes currently registered.
--- * Warning: Clearing and re-registering biomes alters the biome to biome ID
---   correspondences, so any decorations or ores using the 'biomes' field must
---   afterwards be cleared and re-registered.
function core.clear_registered_biomes() end

--- * Clears all decorations currently registered.
function core.clear_registered_decorations() end

--- * Clears all ores currently registered.
function core.clear_registered_ores() end

--- * Clears all schematics currently registered.
function core.clear_registered_schematics() end
