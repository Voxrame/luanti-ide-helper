--- @meta

-- -----------------
-- # Global objects:
-- -----------------


--- `EnvRef` of the server environment and world.
--- * Any function in the minetest namespace can be called using the syntax
---   `core.env:somefunction(somearguments)`
---   instead of `core.somefunction(somearguments)`
--- * Deprecated, but support is not to be dropped soon
---
--- @type table
core.env = {}
