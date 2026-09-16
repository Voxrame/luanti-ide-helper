--- @meta

-- ------------
-- # Inventory:
-- ------------

--- returns an InvRef
--- * location = e.g.
---		{type="player", name="celeron55"}
---		{type="node", pos={x=, y=, z=}}
---		{type="detached", name="creative"}
--- @return InvRef
function core.get_inventory(location) end

--- Returns
---   an `InvRef`.
--- * `callbacks`: See [Detached inventory callbacks]
--- * `player_name`: Make detached inventory available to one player
---   exclusively, by default they will be sent to every player (even if not
---   used).
---   Note that this parameter is mostly just a workaround and will be removed
---   in future releases.
--- * Creates a detached inventory. If it already exists, it is cleared.
---
--- @param name string
--- @param callbacks DetachedInventoryCallbacksDef
--- @param player_name string
--- @return InvRef
function core.create_detached_inventory(name, callbacks, player_name) end

--- * Returns a `boolean` indicating whether the removal succeeded.
---
function core.remove_detached_inventory(name) end

--- Returns left over ItemStack.
--- * See `core.item_eat` and `core.register_on_item_eat`
---
function core.do_item_eat(hp_change, replace_with_item, itemstack, user, pointed_thing) end
