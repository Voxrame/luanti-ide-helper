--- @meta


--- A schematic specifier identifies a schematic by either a filename to a Luanti Schematic file (.mts) or through raw data supplied through Lua, in the form of a table.
--- @class SchematicSpecifier
local SchematicSpecifier = {
	--- Size of the schematic.
	--- Vector containing the dimensions of the provided schematic. (required field)
	--- @type MapPosition
	size = { x = 0, y = 0, z = 0 },

	--- List of Y-slice probabilities.
	--- Each entry contains a Y position and a probability (0-255) that the slice at that Y position will be included when the schematic is placed.
	--- This allows for variation in the placed schematic.
	--- * A probability value of 0 or 1 means that node will never appear (0% chance).
	--- * A probability value of 254 or 255 means the node will always appear (100% chance).
	--- * If the probability value p is greater than 1, then there is a (p / 256 * 100) percent chance that node will appear when the schematic is placed on the map.
	---
	--- Table of {ypos, prob} slice tables. A slice table sets the probability of a particular horizontal slice of the schematic being placed.
	--- (optional field) ypos = 0 for the lowest horizontal slice of a schematic. The default of prob is 255.
	--- @type {ypos: integer, prob: integer}[]?
	yslice_prob = {},

	--- List of nodes in the schematic.
	--- Flat table of MapNode tables making up the schematic, in the order of [z [y [x]]]. (required field)
	data = {
		--- @type string the name of the map node to place (required)
		name = '',
		--- @type integer? (alias param1): the probability of this node being placed (default: 255)
		prob = 0,
		--- @type integer? the raw param2 value of the node being placed onto the map (default: 0)
		param2 = 0,
		--- @type boolean? boolean representing if the node should forcibly overwrite any previous contents (default: false)
		force_place = false,
	},
}
