--- @meta


--- @class BiomeDefinition
--- Definition of a biome for use with `core.register_biome`.
local BiomeDefinition = {
	--- Name of the biome.
	--- @type string
	name = '',

	--- Node dropped onto upper surface after all else is generated.
	--- For example, `"default:snow"`.
	--- @type string?
	node_dust = '',

	--- Node forming surface layer of biome.
	--- For example, `"default:dirt_with_snow"`.
	--- Thickness of this layer can be defined with 'depth_top'.
	--- @type string?
	node_top = '',
	--- Thickness of surface layer, defined with 'node_top'.
	--- @type integer?
	depth_top = 0,

	--- Node forming lower layer of biome.
	--- For example, `"default:permafrost"`.
	--- Thickness of this layer can be defined with 'depth_filler'.
	--- @type string?
	node_filler = '',
	--- Thickness of lower layer, defined with 'node_filler'.
	--- @type integer?
	depth_filler = 0,

	--- Node that replaces all stone nodes between roughly y_min and y_max.
	--- For example, `"default:granite"`.
	--- @type string?
	node_stone = '',

	--- Node forming a surface layer in seawater.
	--- For example, `"default:ice"`.
	--- Thickness of this layer can be defined with 'depth_water_top'.
	--- @type string?
	node_water_top = '',
	--- Thickness of surface layer in seawater, defined with 'node_water_top'.
	--- @type integer?
	depth_water_top = 0,


	--- Node that replaces all seawater nodes not in the surface layer
	--- @type string?
	node_water = '',

	--- Node that replaces river water in mapgens that use `default:river_water`.
	--- @type string?
	node_river_water = '',

	--- Node placed under river water.
	--- For example, `"default:gravel"`.
	--- Thickness of this layer can be defined with 'depth_riverbed'.
	--- @type string?
	node_riverbed = 'default:gravel',
	--- Thickness of layer under river water, defined with 'node_riverbed'.
	--- @type integer?
	depth_riverbed = 2,


	--- Nodes placed inside 50% of the medium size caves.
	--- Multiple nodes can be specified, each cave will use a randomly
	--- chosen node from the list.
	--- If this field is left out or 'nil', cave liquids fall back to
	--- classic behavior of lava and water distributed using 3D noise.
	--- For no cave liquid, specify "air".
	--- `node_cave_liquid = "default:lava_source",`
	--- `node_cave_liquid = {"default:water_source", "default:lava_source"},`
	--- @type string|string[]|nil
	node_cave_liquid = nil,

	--- Node used for primary dungeon structure.
	--- If absent, dungeon nodes fall back to the 'mapgen_cobble' mapgen
	--- alias, if that is also absent, dungeon nodes fall back to the biome
	--- 'node_stone'.
	--- Example: `'default:cobble'`.
	--- If present, the following two nodes are also used.
	--- @type string?
	node_dungeon = '',

	--- Node used for randomly-distributed alternative structure nodes.
	--- If alternative structure nodes are not wanted leave this absent.
	--- Example: `'default:mossycobble'`.
	--- @type string?
	node_dungeon_alt = '',

	--- Node used for dungeon stairs.
	--- If absent, stairs fall back to 'node_dungeon'.
	--- Example: `'stairs:stair_cobble'`.
	--- @type string?
	node_dungeon_stair = 'stairs:stair_cobble',

	--- Upper limit for biome.
	--- Alternatively you can use xyz limits via 'max_pos' and 'min_pos'.
	--- @type integer?
	y_max = 31000,
	--- Lower limit for biome.
	--- Alternatively you can use xyz limits via 'max_pos' and 'min_pos'.
	--- @type integer?
	y_min = 1,

	--- xyz limits for biome, an alternative to using 'y_min' and 'y_max'.
	--- Biome is limited to a cuboid defined by these positions.
	--- Any x, y or z field left undefined defaults to -31000 in 'min_pos' or
	--- 31000 in 'max_pos'.
	--- @type MapPosition|{x:integer?,y:integer?,z:integer?}|nil
	max_pos = { x = 31000, y = 128, z = 31000 },
	--- xyz limits for biome, an alternative to using 'y_min' and 'y_max'.
	--- Biome is limited to a cuboid defined by these positions.
	--- Any x, y or z field left undefined defaults to -31000 in 'min_pos' or
	--- 31000 in 'max_pos'.
	--- @type MapPosition|{x:integer?,y:integer?,z:integer?}|nil
	min_pos = { x = -31000, y = 9, z = -31000 },

	--- Vertical distance in nodes above 'y_max' over which the biome will
	--- blend with the biome above.
	--- Set to 0 for no vertical blend. Defaults to 0.
	--- @type integer?
	vertical_blend = 0,

	--- Characteristic temperature for the biome.
	---
	--- Values `heat_point` & `humidity_point` create 'biome points' on a voronoi diagram with heat and
	--- humidity as axes. The resulting voronoi cells determine the
	--- distribution of the biomes.
	---
	--- Have average values of 50, vary mostly between
	--- 0 and 100 but can exceed these values.
	--- @type integer|number?
	heat_point = 0,
	--- Characteristic humidity for the biome.
	---
	--- Values `heat_point` & `humidity_point` create 'biome points' on a voronoi diagram with heat and
	--- humidity as axes. The resulting voronoi cells determine the
	--- distribution of the biomes.
	---
	--- Have average values of 50, vary mostly between
	--- 0 and 100 but can exceed these values.
	--- @type integer|number?
	humidity_point = 50,

	--- Relative weight of the biome in the Voronoi diagram.
	--- A value of 0 (or less) is ignored and equivalent to 1.0.
	--- @type number?
	weight = 1.0,
}
