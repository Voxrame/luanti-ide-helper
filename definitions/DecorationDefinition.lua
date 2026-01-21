--- @meta


--- DecorationDefinition describes a decoration to be registered with core.register_decoration().
--- See [Decoration types](https://api.luanti.org/definition-tables/#decoration-types).
--- @class DecorationDefinition
local DecorationDefinition = {
	--- Type of decoration. "simple", "schematic" or "lsystem" supported.
	--- @type 'simple'|'schematic'|'lsystem'?
	deco_type = '',

	--- Node (or list of nodes) that the decoration can be placed on.
	--- @type string|string[]?
	place_on = '',

	--- Size of the square (X / Z) divisions of the mapchunk being generated.
	--- Determines the resolution of noise variation if used.
	--- If the chunk size is not evenly divisible by sidelen, sidelen is made
	--- equal to the chunk size.
	--- @type integer?
	sidelen = 0,

	--- The value determines 'decorations per surface node'.
	--- Used only if noise_params is not specified.
	--- If >= 10.0 complete coverage is enabled and decoration placement uses
	--- a different and much faster method.
	--- @type number?
	fill_ratio = 0.02,

	--- NoiseParams structure describing the noise used for decoration
	--- distribution.
	--- A noise value is calculated for each square division and determines
	--- 'decorations per surface node' within each division.
	--- If the noise value >= 10.0 complete coverage is enabled and
	--- decoration placement uses a different and much faster method.
	--- If this parameter is omitted, fill_ratio is used instead.
	---
	--- Example:
	--- ```lua
	--- noise_params = {
	---     offset = 0,
	---     scale = 0.45,
	---     spread = { x = 100, y = 100, z = 100 },
	---     seed = 354,
	---     octaves = 3,
	---     persistence = 0.7,
	---     lacunarity = 2.0,
	---     flags = 'absvalue',
	--- },
	--- ```
	--- @type NoiseParams?
	noise_params = nil,

	--- List of biomes in which this decoration occurs. Occurs in all biomes
	--- if this is omitted, and ignored if the Mapgen being used does not
	--- support biomes.
	--- Can be a list of (or a single) biome names, IDs, or definitions.
	--- @type string[]|string|integer[]|integer|BiomeDefinition[]|BiomeDefinition?
	biomes = {},

	--- Lower limit for decoration (inclusive).
	--- These parameter refer to the Y coordinate of the 'place_on' node.
	--- @type integer?
	y_min = -31000,
	--- Upper limit for decoration (inclusive).
	--- These parameter refer to the Y coordinate of the 'place_on' node.
	--- @type integer?
	y_max = 31000,

	--- Node (or list of nodes) that the decoration only spawns next to.
	--- Checks the 8 neighboring nodes on the same height,
	--- and also the ones at the height plus the `check_offset`, excluding both center nodes.
	---
	--- For example `'default:water'` will make the decoration only spawn next to water.
	--- If instead a list of nodes is given, the decoration will spawn next to any of them.
	--- If omitted, no check is performed.
	---
	--- @type string|string[]?
	spawn_by = '',

	--- Specifies the offset that `spawn_by` should also check.
	--- The default value of -1 is useful to e.g check for water next to the base node.
	--- 0 disables additional checks, valid values: {-1, 0, 1}
	--- @type -1|0|1?
	check_offset = -1,

	--- Number of `spawn_by` nodes that must be surrounding the decoration
	--- position to occur.
	--- If absent or -1, decorations occur next to any nodes.
	--- @type integer?
	num_spawn_by = 1,

	--- Flags for all decoration types.
	--- "liquid_surface": Find the highest liquid (not solid) surface under
	---   open air. Search stops and fails on the first solid node.
	---   Cannot be used with "all_floors" or "all_ceilings" below.
	--- "force_placement": Nodes other than "air" and "ignore" are replaced
	---   by the decoration.
	--- "all_floors", "all_ceilings": Instead of placement on the highest
	---   surface in a mapchunk the decoration is placed on all floor and/or
	---   ceiling surfaces, for example in caves and dungeons.
	---   Ceiling decorations act as an inversion of floor decorations so the
	---   effect of 'place_offset_y' is inverted.
	---   Y-slice probabilities do not function correctly for ceiling
	---   schematic decorations as the behavior is unchanged.
	---   If a single decoration registration has both flags the floor and
	---   ceiling decorations will be aligned vertically.
	--- @type string?
	flags = 'liquid_surface, force_placement, all_floors, all_ceilings',

	----- Simple-type parameters

	--- Used when `deco_type` is `"simple"`.
	---
	--- The node name used as the decoration.
	--- If instead a list of strings, a randomly selected node from the list
	--- is placed as the decoration.
	--- @type string|string[]?
	decoration = 'default:grass',

	--- Used when `deco_type` is `"simple"`.
	---
	--- Decoration height in nodes.
	--- If height_max is not 0, this is the lower limit of a randomly
	--- selected height.
	--- @type integer?
	height = 1,

	--- Used when `deco_type` is `"simple"`.
	---
	--- Upper limit of the randomly selected height.
	--- If absent, the parameter 'height' is used as a constant.
	--- @type integer?
	height_max = 0,

	--- Used when `deco_type` is `"simple"`.
	---
	--- Param2 value of decoration nodes.
	--- If param2_max is not 0, this is the lower limit of a randomly
	--- selected param2.
	--- @type integer?
	param2 = 0,

	--- Used when `deco_type` is `"simple"`.
	---
	--- Upper limit of the randomly selected param2.
	--- If absent, the parameter 'param2' is used as a constant.
	--- @type integer?
	param2_max = 0,

	--- Used when `deco_type` is `"simple"`.
	---
	--- Y offset of the decoration base node relative to the standard base
	--- node position.
	--- Can be positive or negative. Default is 0.
	--- Effect is inverted for "all_ceilings" decorations.
	--- Ignored by 'y_min', 'y_max' and 'spawn_by' checks, which always refer
	--- to the 'place_on' node.
	--- @type integer?
	place_offset_y = 0,

	----- Schematic-type parameters

	--- Used when `deco_type` is `"schematic"`.
	---
	--- If schematic is a string, it is the filepath relative to the current
	--- working directory of the specified Luanti schematic file.
	--- Could also be the ID of a previously registered schematic.
	---
	--- If schematic is a table, it is a SchematicSpecifier structure
	--- describing the schematic directly.
	--- The fields `size` and `data` are mandatory whereas `yslice_prob` is optional.
	--- See ['Schematic specifier'](https://api.luanti.org/schematics/#schematic-specifier) for details.
	--- Example:
	--- ```lua
	--- {
	--- 	size = { x = 4, y = 6, z = 4 },
	--- 	data = {
	--- 		{ name = 'default:cobble',          param1 = 255, param2 = 0 },
	--- 		{ name = 'default:dirt_with_grass', param1 = 255, param2 = 0 },
	--- 		{ name = 'air',                     param1 = 255, param2 = 0 },
	--- 		...,
	--- 	},
	--- 	yslice_prob = {
	--- 		{ ypos = 2, prob = 128 },
	--- 		{ ypos = 5, prob = 64 },
	--- 		...,
	--- 	},
	--- }
	--- ```
	--- @type string|integer|SchematicSpecifier?
	schematic = nil,

	--- Used when `deco_type` is `"schematic"`.
	---
	--- Map of node names to replace in the schematic after reading it.
	--- Key is the old node name, value is the new node name.
	--- If a node name is not found in the map, it is not replaced.
	--- This is useful for reusing schematics with different materials.
	---
	--- Example: `{ ['default:wood'] = 'default:pine_wood', ['default:leaves'] = 'default:pine_leaves' }`
	---
	--- @type table<string, string>?
	replacements = nil,

	--- Used when `deco_type` is `"schematic"`.
	---
	--- Flags for schematic decorations. See ['Schematic attributes'](https://api.luanti.org/schematics/#schematic-attributes).
	---
	--- Example: `flags = 'place_center_x, place_center_y, place_center_z'`
	---
	--- @type string?
	flags = '',

	--- Used when `deco_type` is `"schematic"`.
	---
	--- Rotation can be "0", "90", "180", "270", or "random"
	--- @type '0'|'90'|'180'|'270'|'random'?
	rotation = '90',

	--- Used when `deco_type` is `"schematic"`.
	---
	--- If the flag 'place_center_y' is set this parameter is ignored.
	--- Y offset of the schematic base node layer relative to the 'place_on'
	--- node.
	---
	--- Can be positive or negative. Default is 0.
	--- Effect is inverted for "all_ceilings" decorations.
	--- Ignored by 'y_min', 'y_max' and 'spawn_by' checks, which always refer
	--- to the 'place_on' node.
	--- @type integer?
	place_offset_y = 0,

	----- L-system-type parameters

	--- Used when `deco_type` is `"lsystem"`.
	---
	--- Same as for `core.spawn_tree`.
	--- See section [L-system trees](https://api.luanti.org/l-system-trees/) for more details.
	--- @see core.spawn_tree
	--- @type LSystemTreeDefinition?
	treedef = {},
}
