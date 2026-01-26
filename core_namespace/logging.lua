--- @meta


--- Equivalent to `core.log(table.concat({...}, "\t"))`
---
--- Calls `core.log()` with all arguments converted to string and separated by tabs (similar to print).
---
--- @param ... any
function core.debug(...) end

--- @alias LogLevel
--- | "none"
--- | "error"
--- | "warning"
--- | "action"
--- | "info"
--- | "verbose"

--- Logs a message at the specified log level.
---
--- @overload fun(text:string)
--- @param level? LogLevel  # [Optional] is one of `"none"`, `"error"`, `"warning"`, `"action"`, `"info"`, or `"verbose"`.  Default is `"none"`.
--- @param text   string
function core.log(level, text) end
