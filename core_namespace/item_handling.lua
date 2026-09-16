--- @meta

-- ----------------
-- # Item handling:
-- ----------------


--- * Returns a string for making an image of a cube (useful as an item image)
---
function core.inventorycube(img1, img2, img3) end

--- * Returns the position of a `pointed_thing` or `nil` if the `pointed_thing`
---   does not refer to a node or entity.
--- * If the optional `above` parameter is true and the `pointed_thing` refers
---   to a node, then it will return the `above` position of the `pointed_thing`.
---
function core.get_pointed_thing_position(pointed_thing, above) end

--- * Convert a vector to a facedir value, used in `param2` for
---   `paramtype2="facedir"`.
--- * passing something non-`nil`/`false` for the optional second parameter
---   causes it to take the y component into account.
---
function core.dir_to_facedir(dir, is6d) end

--- * Convert a facedir back into a vector aimed directly out the "back" of a
---   node.
---
function core.facedir_to_dir(facedir) end

--- * Convert a vector to a wallmounted value, used for
---   `paramtype2="wallmounted"`.
---
function core.dir_to_wallmounted(dir) end

--- * Convert a wallmounted value back into a vector aimed directly out the
---   "back" of a node.
---
function core.wallmounted_to_dir(wallmounted) end

--- * Convert a vector into a yaw (angle)
---
function core.dir_to_yaw(dir) end

--- * Convert yaw (angle) to a vector
---
function core.yaw_to_dir(yaw) end

--- * Returns a boolean. Returns `true` if the given `paramtype2` contains
---   color information (`color`, `colorwallmounted` or `colorfacedir`).
---
function core.is_colored_paramtype(ptype) end

--- * Removes everything but the color information from the
---   given `param2` value.
--- * Returns `nil` if the given `paramtype2` does not contain color
---   information.
---
function core.strip_param2_color(param2, paramtype2) end

--- * Returns list of itemstrings that are dropped by `node` when dug
---   with `toolname`.
--- * `node`: node as table or node name
--- * `toolname`: name of the tool item (can be `nil`)
---
function core.get_node_drops(node, toolname) end

--- @class RecipeInput
--- @field method string      `"normal"` or `"cooking"` or `"fuel"`
--- @field width  number      for example `3`
--- @field items  ItemStack[] for example `{stack1, stack2, stack3, stack4, stack 5, stack 6, stack 7, stack 8, stack 9}`

--- @class RecipeOutput
--- @field item         ItemStack
--- @field time         number
--- @field replacements ItemStack[][]

--- Returns `output, decremented_input`
--- * `input.method` = `"normal"` or `"cooking"` or `"fuel"`
--- * `input.width` = for example `3`
--- * `input.items` = for example
---   `{stack1, stack2, stack3, stack4, stack 5, stack 6, stack 7, stack 8, stack 9}`
--- * `output.item` = `ItemStack`, if unsuccessful: empty `ItemStack`
--- * `output.time` = a number, if unsuccessful: `0`
--- * `output.replacements` = List of replacement `ItemStack`s that couldn't be
---   placed in `decremented_input.items`. Replacements can be placed in
---   `decremented_input` if the stack of the replaced item has a count of 1.
--- * `decremented_input` = like `input`
---
--- @param input RecipeInput
--- @return RecipeOutput, RecipeInput
function core.get_craft_result(input) end

--- Returns input
--- * returns last registered recipe for output item (node)
--- * `output` is a node or item type such as `"default:torch"`
--- * `input.method` = `"normal"` or `"cooking"` or `"fuel"`
--- * `input.width` = for example `3`
--- * `input.items` = for example
---   `{stack1, stack2, stack3, stack4, stack 5, stack 6, stack 7, stack 8, stack 9}`
---     * `input.items` = `nil` if no recipe found
---
--- @param output string node or item tech name such as `"default:torch"`
--- @return RecipeInput
function core.get_craft_recipe(output) end

--- @class RecipeEntryTable
--- @field method string   'normal' or 'cooking' or 'fuel'
--- @field width  number   0-3, 0 means shapeless recipe
--- @field items  string[] indexed [1-9] table with recipe items
--- @field output string   string with item name and quantity

--- Returns a table or `nil`
--- * returns indexed table with all registered recipes for query item (node)
---   or `nil` if no recipe was found.
--- * recipe entry table:
---     * `method`: 'normal' or 'cooking' or 'fuel'
---     * `width`: 0-3, 0 means shapeless recipe
---     * `items`: indexed [1-9] table with recipe items
---     * `output`: string with item name and quantity
--- * Example query for `"default:gold_ingot"` will return table:
---   ```lua
---       {
---           [1]={method = "cooking", width = 3, output = "default:gold_ingot", items = {1 = "default:gold_lump"}},
---           [2]={method = "normal", width = 1, output = "default:gold_ingot 9", items = {1 = "default:goldblock"}}
---       }
---   ```
---
---
--- @return RecipeEntryTable[]|nil
function core.get_all_craft_recipes(query_item) end

--- * `drops`: list of itemstrings
--- * Handles drops from nodes after digging: Default action is to put them
---   into digger's inventory.
--- * Can be overridden to get different functionality (e.g. dropping items on
---   ground)
---
function core.handle_node_drops(pos, drops, digger) end

--- Returns an item
---   string.
--- * Creates an item string which contains palette index information
---   for hardware colorization. You can use the returned string
---   as an output in a craft recipe.
--- * `item`: the item stack which becomes colored. Can be in string,
---   table and native form.
--- * `palette_index`: this index is added to the item stack
---
function core.itemstring_with_palette(item, palette_index) end

--- Returns an item string
--- * Creates an item string which contains static color information
---   for hardware colorization. Use this method if you wish to colorize
---   an item that does not own a palette. You can use the returned string
---   as an output in a craft recipe.
--- * `item`: the item stack which becomes colored. Can be in string,
---   table and native form.
--- * `colorstring`: the new color of the item stack
---
function core.itemstring_with_color(item, colorstring) end
