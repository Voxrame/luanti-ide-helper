--- @meta


--- A fast, bulk noise generator.
---
--- It can be created via `ValueNoiseMap(noiseparams, size)` or
--- `core.get_value_noise_map(noiseparams, size)`.
--- For `core.get_value_noise_map()`, the actual seed used is the noiseparams seed
--- plus the world seed, to create world-specific noise.
---
--- Format of `size` is `{x=dimx, y=dimy, z=dimz}`. The `z` component is omitted
--- for 2D noise, and it must be larger than 1 for 3D noise (otherwise
--- `nil` is returned).
---
--- For each of the functions with an optional `buffer` parameter:If `buffer` is not nil, this
--- table will be used to store the result instead of creating a new table.
---
--- **Important**: These require the mapgen environment to be initalized, do not use at load time.
--- @class ValueNoiseMap
ValueNoiseMap = {}

--- Returns a `<size.x>` times `<size.y>` 2D array of 2D noise
--- with values starting at `pos={x=,y=}`
--- @param pos MapPosition2d
--- @return table
function ValueNoiseMap:get_2d_map(pos) end

--- Returns a `<size.x>` times `<size.y>` times `<size.z>`
--- 3D array of 3D noise with values starting at `pos={x=,y=,z=}`
--- @param pos MapPosition
--- @return table
function ValueNoiseMap:get_3d_map(pos) end

--- Returns a flat `<size.x * size.y>` element
--- array of 2D noise with values starting at `pos={x=,y=}`
--- @param pos    MapPosition2d
--- @param buffer table If `buffer` is not nil, this table will be used to store the result instead of creating a new table.
--- @return table
function ValueNoiseMap:get_2d_map_flat(pos, buffer) end

--- Same as `get2dMap_flat`, but 3D noise
--- @param pos    MapPosition
--- @param buffer table If `buffer` is not nil, this table will be used to store the result instead of creating a new table.
--- @return table
function ValueNoiseMap:get_3d_map_flat(pos, buffer) end

--- Calculates the 2d noise map starting at `pos`. The result
--- is stored internally.
--- @param pos MapPosition2d
function ValueNoiseMap:calc_2d_map(pos) end

--- Calculates the 3d noise map starting at `pos`. The result
--- is stored internally.
--- @param pos MapPosition
function ValueNoiseMap:calc_3d_map(pos) end

--- In the form of an array,
--- returns a slice of the most recently computed noise results. The result slice
--- begins at coordinates `slice_offset` and takes a chunk of `slice_size`.
--- E.g., to grab a 2-slice high horizontal 2d plane of noise starting at buffer
--- offset `y = 20`:
--- ```lua
--- noisevals = noise:get_map_slice({y=20}, {y=2})
--- ```
--- It is important to note that `slice_offset` offset coordinates begin at 1,
--- and are relative to the starting position of the most recently calculated
--- noise.
--- To grab a single vertical column of noise starting at map coordinates
--- `x = 1023, y=1000, z = 1000`:
--- ```lua
--- noise:calc_3d_map({x=1000, y=1000, z=1000})
--- noisevals = noise:get_map_slice({x=24, z=1}, {x=1, z=1})
--- ```
--- @param slice_offset {x:integer?,y:integer?,z:integer?}
--- @param slice_size   {x:integer?,y:integer?,z:integer?}
--- @param buffer       table If `buffer` is not nil, this table will be used to store the result instead of creating a new table.
--- @return table
function ValueNoiseMap:get_map_slice(slice_offset, slice_size, buffer) end
