
--- @class OreDefinition
--- Defines an ore to be registered with `core.register_ore`.
--- See https://api.luanti.org/ores/ for details.
local OreDefinition = {
    --- If set, `core.registered_ores[that_name]` will return this definition.
	--- @type string?
    name = "",

    --- Supported: "scatter", "sheet", "puff", "blob", "vein", "stratum"
	--- @type string?
    ore_type = "",

    --- Ore node to place
	--- @type string
    ore = "",

    --- Param2 to set for ore (e.g. facedir rotation)
	--- @type integer?
    ore_param2 = 0,

    --- Node to place ore in. Multiple are possible by passing a list.
	--- @type string|string[]|nil
    wherein = "",

    --- Ore has a 1 out of clust_scarcity chance of spawning in a node.
    --- If the desired average distance between ores is 'd', set this to
    --- d * d * d.
	--- @type integer?
    clust_scarcity = 8 * 8 * 8,

    --- Number of ores in a cluster
	--- @type integer?
    clust_num_ores = 8,

    --- Size of the bounding box of the cluster.
    --- In this example, there is a 3 * 3 * 3 cluster where 8 out of the 27
    --- nodes are coal ore.
	--- @type integer?
    clust_size = 3,

    --- Lower limit for ore (inclusive)
	--- @type integer?
    y_min = -31000,
    --- Upper limit for ore (inclusive)
	--- @type integer?
    y_max = 31000,

    --- Attributes for the ore generation, see [Ore attributes](https://api.luanti.org/ores/#ore-attributes) section.
	--- @type string?
    flags = "",

    --- If noise is above this threshold, ore is placed. Not needed for a
    --- uniform distribution.
	--- @type number?
    noise_threshold = 0,

    --- NoiseParams structure describing one of the noises used for
    --- ore distribution.
    --- Needed by "sheet", "puff", "blob" and "vein" ores.
    --- Omit from "scatter" ore for a uniform ore distribution.
    --- Omit from "stratum" ore for a simple horizontal strata from y_min to
    --- y_max.
	---
	--- Example:
	--- ```lua
	--- {
	--- 	offset = 0,
	--- 	scale = 1,
	--- 	spread = {x = 100, y = 100, z = 100},
	--- 	seed = 23,
	--- 	octaves = 3,
	--- 	persistence = 0.7
	--- }
	--- ```
	--- @type NoiseParams?
    noise_params = nil,

    --- List of biomes in which this ore occurs.
    --- Occurs in all biomes if this is omitted, and ignored if the Mapgen
    --- being used does not support biomes.
    --- Can be a list of (or a single) biome names, IDs, or definitions.
	--- Example: `{ "desert", "rainforest" }`
	--- @type (string|integer|BiomeDefinition)[]?
    biomes = {},

    --- Used for `ore_type = "sheet"`
    column_height_min = 1,
    --- Used for `ore_type = "sheet"`
    column_height_max = 16,
    --- Used for `ore_type = "sheet"`
    column_midpoint_factor = 0.5,

    --- Used for `ore_type = "puff"`
    np_puff_top = {
        offset = 4,
        scale = 2,
        spread = {x = 100, y = 100, z = 100},
        seed = 47,
        octaves = 3,
        persistence = 0.7
    },
    --- Used for `ore_type = "puff"`
    np_puff_bottom = {
        offset = 4,
        scale = 2,
        spread = {x = 100, y = 100, z = 100},
        seed = 11,
        octaves = 3,
        persistence = 0.7
    },

    --- Used for `ore_type = "vein"`
    random_factor = 1.0,

    --- Used for `ore_type = "stratum"`
    np_stratum_thickness = {
        offset = 8,
        scale = 4,
        spread = {x = 100, y = 100, z = 100},
        seed = 17,
        octaves = 3,
        persistence = 0.7
    },
	--- only used if no noise defined
	stratum_thickness = 8,
}
