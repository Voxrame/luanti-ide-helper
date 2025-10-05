--- @diagnostic disable: missing-return

--- A value noise generator. It can be created via ValueNoise() or core.get_value_noise().
--- For core.get_value_noise(), the actual seed used is the noiseparams seed plus the world
--- seed, to create world-specific noise.
---
--- **Important**: These require the mapgen environment to be initalized, do not use at load time.
---
--- * `ValueNoise(noiseparams)`
--- * `ValueNoise(seed, octaves, persistence, spread)` (deprecated)
--- * `core.get_value_noise(noiseparams)`
--- * `core.get_value_noise(seeddiff, octaves, persistence, spread)` (deprecated)
--- @class ValueNoise
ValueNoise = {}

--- Returns 2D noise value at `pos={x=,y=}`
--- @param pos vector|{x:number,y:number}
--- @return number
function ValueNoise:get_2d(pos) end

--- Returns 3D noise value at `pos={x=,y=,z=}`
--- @param pos vector|{x:number,y:number,z:number}
--- @return number
function ValueNoise:get_3d(pos) end
