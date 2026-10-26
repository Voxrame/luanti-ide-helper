--- @meta

-- ----------------
-- # HTTP Requests:
-- ----------------


--- * returns `HTTPApiTable` containing http functions if the calling mod has
---   been granted access by being listed in the `secure.http_mods` or
---   `secure.trusted_mods` setting, otherwise returns `nil`.
--- * The returned table contains the functions `fetch`, `fetch_async` and
---   `fetch_async_get` described below.
--- * Only works at init time and must be called from the mod's main scope
---   (not from a function).
--- * Function only exists if minetest server was built with cURL support.
--- * **DO NOT ALLOW ANY OTHER MODS TO ACCESS THE RETURNED TABLE, STORE IT IN
---   A LOCAL VARIABLE!**
---
---
--- @return HTTPApiTable
function core.request_http_api() end
