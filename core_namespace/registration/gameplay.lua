--- @meta

--- Registers a crafting recipe.
--- * Check recipe table syntax for different types below.
--- [TODO]: Link to recipe table syntax documentation.
--- @param recipe table
function core.register_craft(recipe) end

--- * Will erase existing craft based either on output item or on input recipe.
--- * Specify either output or input only. If you specify both, input will be
---   ignored. For input use the same recipe table syntax as for
---   `core.register_craft(recipe)`. For output specify only the item,
---   without a quantity.
--- * Returns false if no erase candidate could be found, otherwise returns true.
--- * **Warning**! The type field ("shaped", "cooking" or any other) will be
---   ignored if the recipe contains output. Erasing is then done independently
---   from the crafting method.
---
--- @param recipe table
--- @return boolean
function core.clear_craft(recipe) end

--- Registers a chatcommand.
--- * `cmd` is the name of the command without the leading slash.
--- * `chatcommand_definition` is a table containing the following fields:
---   * `description` (string) A short description of the command.
---   * `params` (string) A string describing the parameters of the command.
---   * `privs` (table) A table specifying the privileges required to use the command.
---   * `func` (function) The function to be called when the command is executed.  \
---     It receives two parameters:
---      * `name` (string) the name of the player who executed the command, and
---      * `param` (string) the parameters passed to the command.
---
---     It should return two values:
---      * `success` (boolean) and
---      * `message` (string).
---
---     If `success` is false, `message` will be sent to the player as an error message.  \
---     If `success` is true, `message` will be sent as a regular chat message.
---     If it returns `false` and no `message`, the help message is shown.
---
--- @param cmd                    string
--- @param chatcommand_definition ChatCommandDefinition
function core.register_chatcommand(cmd, chatcommand_definition) end

--- Overrides fields of a chatcommand registered with `register_chatcommand`.
---
--- @param name         string
--- @param redefinition ChatCommandDefinition
function core.override_chatcommand(name, redefinition) end

--- Unregisters a chatcommands registered with `register_chatcommand`.
---
--- @param name string
function core.unregister_chatcommand(name) end

--- Registers a privilege.
--- * `definition` can be a description or a definition table
--- * If it is a description, the priv will be granted to singleplayer and admin by default.
--- * To allow players with `basic_privs` to grant, see the `basic_privs` minetest.conf setting.
---
--- @param name       string
--- @param definition string|PrivilegeDefinition
function core.register_privilege(name, definition) end

--- Registers an authentication handler.
--- * Registers an auth handler that overrides the builtin one.
--- * This function can be called by a single mod once only.
---
--- @param authentication_handler_definition AuthenticationHandlerDefinition
function core.register_authentication_handler(authentication_handler_definition) end
