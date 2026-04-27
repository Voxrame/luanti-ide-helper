--- @meta

--- ItemStack metadata: reference extra data and functionality stored in a stack.
--- Can be obtained via `item:get_meta()`.
---
--- @class ItemStackMetaRef: MetaDataRef
ItemStackMetaRef = {}

--- * Overrides the item's tool capabilities
--- * A nil value will clear the override data and restore the original behavior.
function ItemStackMetaRef:set_tool_capabilities(tool_capabilities) end

--- * Overrides the item's wear bar parameters (see "Wear Bar Color" section)
--- * A nil value will clear the override data and restore the original behavior.
function ItemStackMetaRef:set_wear_bar_params(wear_bar_params) end
