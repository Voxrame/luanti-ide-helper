--- @meta

-- -------------
-- # Schematics:
-- -------------


--- * Create a schematic from the volume of map specified by the box formed by
---   p1 and p2.
--- * Apply the specified probability and per-node force-place to the specified
---   nodes according to the `probability_list`.
---     * `probability_list` is an array of tables containing two fields, `pos`
---       and `prob`.
---         * `pos` is the 3D vector specifying the absolute coordinates of the
---           node being modified,
---         * `prob` is an integer value from `0` to `255` that encodes
---           probability and per-node force-place. Probability has levels
---           0-127, then 128 may be added to encode per-node force-place.
---           For probability stated as 0-255, divide by 2 and round down to
---           get values 0-127, then add 128 to apply per-node force-place.
---         * If there are two or more entries with the same pos value, the
---           last entry is used.
---         * If `pos` is not inside the box formed by `p1` and `p2`, it is
---           ignored.
---         * If `probability_list` equals `nil`, no probabilities are applied.
--- * Apply the specified probability to the specified horizontal slices
---   according to the `slice_prob_list`.
---     * `slice_prob_list` is an array of tables containing two fields, `ypos`
---       and `prob`.
---         * `ypos` indicates the y position of the slice with a probability
---           applied, the lowest slice being `ypos = 0`.
---         * If slice probability list equals `nil`, no slice probabilities
---           are applied.
--- * Saves schematic in the Minetest Schematic format to filename.
---
function core.create_schematic(p1, p2, probability_list, filename, slice_prob_list) end

--- * Place the schematic specified by schematic (see [Schematic specifier]) at
---   `pos`.
--- * `rotation` can equal `"0"`, `"90"`, `"180"`, `"270"`, or `"random"`.
--- * If the `rotation` parameter is omitted, the schematic is not rotated.
--- * `replacements` = `{["old_name"] = "convert_to", ...}`
--- * `force_placement` is a boolean indicating whether nodes other than `air`
---   and `ignore` are replaced by the schematic.
--- * Returns nil if the schematic could not be loaded.
--- * **Warning**: Once you have loaded a schematic from a file, it will be
---   cached. Future calls will always use the cached version and the
---   replacement list defined for it, regardless of whether the file or the
---   replacement list parameter have changed. The only way to load the file
---   anew is to restart the server.
--- * `flags` is a flag field with the available flags:
---     * place_center_x
---     * place_center_y
---     * place_center_z
---
function core.place_schematic(pos, schematic, rotation, replacements, force_placement, flags) end

--- * This function is analogous to core.place_schematic, but places a
---   schematic onto the specified VoxelManip object `vmanip` instead of the
---   map.
--- * Returns false if any part of the schematic was cut-off due to the
---   VoxelManip not containing the full area required, and true if the whole
---   schematic was able to fit.
--- * Returns nil if the schematic could not be loaded.
--- * After execution, any external copies of the VoxelManip contents are
---   invalidated.
--- * `flags` is a flag field with the available flags:
---     * place_center_x
---     * place_center_y
---     * place_center_z
---
function core.place_schematic_on_vmanip(vmanip, pos, schematic, rotation, replacement, force_placement, flags) end

--- * Return the serialized schematic specified by schematic
---   (see [Schematic specifier])
--- * in the `format` of either "mts" or "lua".
--- * "mts" - a string containing the binary MTS data used in the MTS file
---   format.
--- * "lua" - a string containing Lua code representing the schematic in table
---   format.
--- * `options` is a table containing the following optional parameters:
---     * If `lua_use_comments` is true and `format` is "lua", the Lua code
---       generated will have (X, Z) position comments for every X row
---       generated in the schematic data for easier reading.
---     * If `lua_num_indent_spaces` is a nonzero number and `format` is "lua",
---       the Lua code generated will use that number of spaces as indentation
---       instead of a tab character.
---
function core.serialize_schematic(schematic, format, options) end

--- * Returns a Lua table representing the schematic (see: [Schematic specifier])
--- * `schematic` is the schematic to read (see: [Schematic specifier])
--- * `options` is a table containing the following optional parameters:
---     * `write_yslice_prob`: string value:
---         * `none`: no `write_yslice_prob` table is inserted,
---         * `low`: only probabilities that are not 254 or 255 are written in
---           the `write_ylisce_prob` table,
---         * `all`: write all probabilities to the `write_yslice_prob` table.
---         * The default for this option is `all`.
---         * Any invalid value will be interpreted as `all`.
---
function core.read_schematic(schematic, options) end
