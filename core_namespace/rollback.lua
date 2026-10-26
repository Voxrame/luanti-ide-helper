--- @meta

-- -----------
-- # Rollback:
-- -----------


--- Returns `{{actor, pos, time, oldnode, newnode}, ...}`
--- * Find who has done something to a node, or near a node
--- * `actor`: `"player:<name>"`, also `"liquid"`.
---
function core.rollback_get_node_actions(pos, range, seconds, limit) end

--- Returns
---   `boolean, log_messages`.
--- * Revert latest actions of someone
--- * `actor`: `"player:<name>"`, also `"liquid"`.
---
function core.rollback_revert_actions_by(actor, seconds) end
