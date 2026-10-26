--- @meta

-- --------------------
-- # Async environment:
-- --------------------


--- * Queue the function `func` to be ran in an async environment.
---   Note that there are multiple persistent workers and any of them may
---   end up running a given job. The engine will scale the amount of
---   worker threads automatically.
--- * When `func` returns the callback is called (in the normal environment)
---   with all of the return values as arguments.
--- * Optional: Variable number of arguments that are passed to `func`
--- @since 5.6
function core.handle_async(func, callback, ...) end

--- * Register a path to a Lua file to be imported when an async environment
---   is initialized. You can use this to preload code which you can then call
---   later using `core.handle_async()`.
--- @since 5.6
function core.register_async_dofile(path) end
