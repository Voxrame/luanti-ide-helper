--- @meta

-- ---------------------------------------------------------------------
-- # Defaults for the `on_punch` and `on_dig` node definition callbacks:
-- ---------------------------------------------------------------------


--- * Calls functions registered by `core.register_on_punchnode()`
---
--- @param pos MapPosition
function core.node_punch(pos, node, puncher, pointed_thing) end

--- * Checks if node can be dug, puts item into inventory, removes node
--- * Calls functions registered by `core.registered_on_dignodes()`
--- * Returns `true` if the node was dig.
--- @param pos MapPosition
--- @return boolean
function core.node_dig(pos, node, digger) end
