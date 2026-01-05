--- @diagnostic disable: missing-return


--- @class VoxelArea
--- A helper class for voxel areas.
--- It can be created via `VoxelArea(pmin, pmax)` or
--- `VoxelArea:new({MinEdge = pmin, MaxEdge = pmax})`.
--- The coordinates are *inclusive*, like most other things in Luanti.
---
--- @field MinEdge Position
--- @field MaxEdge Position
--- @field ystride integer
--- @field zstride integer
VoxelArea = {}

--- The coordinates are *inclusive*, like most other things in Luanti.
---
--- Also you can create an instance via `VoxelArea(pmin, pmax)`
---
--- @param cuboid { MinEdge: Position, MaxEdge: Position }
--- @return VoxelArea
function VoxelArea:new(cuboid) end

--- returns a 3D vector containing the size of the area formed by `MinEdge` and `MaxEdge`.
--- @return Position
function VoxelArea:getExtent() end

--- returns the volume of the area formed by `MinEdge` and `MaxEdge`.
--- @return integer
function VoxelArea:getVolume() end

--- returns the index of an absolute position in a flat array starting at `1`.
---  * `x`, `y` and `z` must be integers to avoid an incorrect index result.
---  * The position (x, y, z) is not checked for being inside the area volume,
---    being outside can cause an incorrect index result.
---  * Useful for things like `VoxelManip`, raw Schematic specifiers,
---    `PerlinNoiseMap:get2d`/`3dMap`, and so on.
--- @param x integer
--- @param y integer
--- @param z integer
--- @return integer
function VoxelArea:index(x, y, z) end

--- same functionality as `index(x, y, z)` but takes a vector.
---     * As with `index(x, y, z)`, the components of `p` must be integers, and `p`
---       is not checked for being inside the area volume.
--- @param position Position
--- @return integer
function VoxelArea:indexp(position) end

--- returns the absolute position vector corresponding to index `i`.
--- @param i integer
--- @return Position
function VoxelArea:position(i) end

--- check if (`x`,`y`,`z`) is inside area formed by `MinEdge` and `MaxEdge`.
--- @param x integer
--- @param y integer
--- @param z integer
--- @return boolean
function VoxelArea:contains(x, y, z) end

--- check if Position(`x`,`y`,`z`) is inside area formed by `MinEdge` and `MaxEdge`.
--- @param position Position
--- @return boolean
function VoxelArea:containsp(position) end

--- same as `:containsp()`, except takes an index `i`
--- @param i integer
--- @return boolean
function VoxelArea:containsi(i) end

--- returns an iterator that returns indices.
---  * from (`min_x`,`min_y`,`min_z`) to (`max_x`,`max_y`,`max_z`) in the order of `[z [y [x]]]`.
--- @param min_x integer
--- @param min_y integer
--- @param min_z integer
--- @param max_x integer
--- @param max_y integer
--- @param max_z integer
--- @return fun(tbl: table<number, number>): number, number
function VoxelArea:iter(min_x, min_y, min_z, max_x, max_y, max_z) end

--- returns an iterator that returns indices.
---  * from (`min_x`,`min_y`,`min_z`) to (`max_x`,`max_y`,`max_z`) in the order of `[z [y [x]]]`.
--- @param min_pos Position
--- @param max_pos Position
--- @return fun(tbl: table<number, number>): number, number
function VoxelArea:iterp(min_pos, max_pos) end
