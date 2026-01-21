
--- @class LSystemTreeDefinition
--- @field axiom          string  initial tree axiom
--- @field rules_a        string  rules set A
--- @field rules_b        string  rules set B
--- @field rules_c        string  rules set C
--- @field rules_d        string  rules set D
--- @field trunk          string  trunk node name
--- @field leaves         string  leaves node name
--- @field leaves2        string  secondary leaves node name
--- @field leaves2_chance number  chance (0-100) to replace leaves with leaves2
--- @field angle          number  angle in degr
--- @field iterations     number  max number of iterations, usually 2 -5
--- @field random_level   number  factor to lower number of iterations, usually 0 - 3
--- @field trunk_type     string  single/double/crossed) type of trunk: 1 node, 2x2 nodes or 3x3 in cross shape
--- @field thin_branches  boolean true -> use thin (1 node) branches
--- @field fruit          string  fruit node name
--- @field fruit_chance   number  chance (0-100) to replace leaves with fruit node
--- @field seed           number  random seed, if no seed is provided, the engine will create one.
local LSystemTreeDefinition = {}
