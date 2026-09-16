--- @meta

-- -----------
-- # Formspec:
-- -----------

--- @param player_name string name of player to show formspec
--- @param form_name   string name passed to `on_player_receive_fields` callbacks. It should follow the `"modname:<whatever>"` naming convention
--- @param form_spec   string formspec to display (https://api.luanti.org/formspec/)
function core.show_formspec(player_name, form_name, form_spec) end

--- * `playername`: name of player to close formspec
--- * `formname`: has to exactly match the one given in `show_formspec`, or the
---   formspec will not close.
--- * calling `show_formspec(playername, formname, "")` is equal to this
---   expression.
--- * to close a formspec regardless of the formname, call
---   `core.close_formspec(playername, "")`.
---   **USE THIS ONLY WHEN ABSOLUTELY NECESSARY!**
---
function core.close_formspec(playername, formname) end

--- Returns a string
--- * escapes the characters "[", "]", "\", "," and ";", which can not be used
---   in formspecs.
---
function core.formspec_escape(string) end

--- Returns a table
--- * returns e.g. `{type="CHG", row=1, column=2}`
--- * `type` is one of:
---     * `"INV"`: no row selected
---     * `"CHG"`: selected
---     * `"DCL"`: double-click
---
function core.explode_table_event(string) end

--- Returns a table
--- * returns e.g. `{type="CHG", index=1}`
--- * `type` is one of:
---     * `"INV"`: no row selected
---     * `"CHG"`: selected
---     * `"DCL"`: double-click
---
function core.explode_textlist_event(string) end

--- Returns a table
--- * returns e.g. `{type="CHG", value=500}`
--- * `type` is one of:
---     * `"INV"`: something failed
---     * `"CHG"`: has been changed
---     * `"VAL"`: not changed
---
function core.explode_scrollbar_event(string) end
