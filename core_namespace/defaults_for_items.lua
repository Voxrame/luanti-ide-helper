--- @meta

-- ----------------------------------------------------------------------
-- # Defaults for the `on_place` and `on_drop` item definition functions:
-- ----------------------------------------------------------------------


--- * Place item as a node
--- * `param2` overrides `facedir` and wallmounted `param2`
--- * `prevent_after_place`: if set to `true`, `after_place_node` is not called
---   for the newly placed node to prevent a callback and placement loop
--- * returns `itemstack, position`
---   * `position`: the location the node was placed to. `nil` if nothing was placed.
---
--- @param itemstack           ItemStack
--- @param placer              Player|ObjectRef
--- @param pointed_thing       pointed_thing
--- @param param2              number
--- @param prevent_after_place boolean
--- @return ItemStack, vector|nil
function core.item_place_node(itemstack, placer, pointed_thing, param2, prevent_after_place) end

--- * Place item as-is
--- * returns the leftover itemstack
--- * **Note**: This function is deprecated and will never be called.
---
function core.item_place_object(itemstack, placer, pointed_thing) end

--- * Wrapper that calls `core.item_place_node` if appropriate
--- * Calls `on_rightclick` of `pointed_thing.under` if defined instead
--- * **Note**: is not called when wielded item overrides `on_place`
--- * `param2` overrides facedir and wallmounted `param2`
--- * returns `itemstack, position`
---   * `position`: the location the node was placed to. `nil` if nothing was placed.
---
--- @param itemstack     ItemStack
--- @param placer        Player|ObjectRef|nil
--- @param pointed_thing pointed_thing
--- @param param2?       number
--- @return ItemStack, vector|nil
function core.item_place(itemstack, placer, pointed_thing, param2) end

--- * Runs callbacks registered by `core.register_on_item_pickup` and adds the item to the picker's `"main"` inventory list.
--- * Parameters and return value are the same as `on_pickup`.
--- * **Note**: is not called when wielded item overrides `on_pickup`
--- @param itemstack            ItemStack
--- @param picker               Player|ObjectRef|nil
--- @param pointed_thing        pointed_thing
--- @param time_from_last_punch number
--- @param ...                  any
function core.item_pickup(itemstack, picker, pointed_thing, time_from_last_punch, ...) end

--- * Global secondary use callback. Does nothing.
--- * Parameters and return value are the same as on_secondary_use.
--- * **Note**: is not called when wielded item overrides on_secondary_use
--- @param itemstack   ItemStack
--- @param user Player|ObjectRef|nil
function core.item_secondary_use(itemstack, user) end

--- * Drop the item
--- * returns the leftover itemstack
---
--- @param itemstack ItemStack
--- @param dropper   Player|ObjectRef|nil
--- @param pos       Position
--- @return ItemStack
function core.item_drop(itemstack, dropper, pos) end

--- * Returns `function(itemstack, user, pointed_thing)` as a
---   function wrapper for `core.do_item_eat`.
--- * `replace_with_item` is the itemstring which is added to the inventory.
---   If the player is eating a stack, then replace_with_item goes to a
---   different spot.
---
function core.item_eat(hp_change, replace_with_item) end
