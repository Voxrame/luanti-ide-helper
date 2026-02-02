--- @meta


--- e.g. `"a,b":split(",")` returns `{"a","b"}`
--- @param separator?      string   cannot be empty, default: `","`
--- @param include_empty?  boolean  default: `false`
--- @param max_splits?     number   if it's negative, splits aren't limited, default: `-1`
--- @param sep_is_pattern? boolean  it specifies whether separator is a plain string or a pattern (regex), default: `false`
--- @return string[]
function string:split(separator, include_empty, max_splits, sep_is_pattern) end

--- Returns the string without whitespace pre- and suffixes
--- e.g. `"\n \t\tfoo bar\t ":trim()` returns `"foo bar"`
--- @return string
function string:trim() end

--- Backported from Lua 5.4, see https://www.lua.org/manual/5.4/manual.html#6.4.2
---
--- Returns a binary string containing the values `v1`, `v2`, etc. packed (that
--- is, serialized in binary form) according to the format string `fmt`.
---
--- @param fmt string
--- @param v1  string
--- @param v2? string
--- @param ... string
---
--- @return string
function string.pack(fmt, v1, v2, ...) end

--- Backported from Lua 5.4, see https://www.lua.org/manual/5.4/manual.html#6.4.2
---
--- Returns the values packed in string `s` according to the format string
--- `fmt`. An optional `pos` marks where to start reading in `s` (default is 1).
--- After the read values, this function also returns the index of the first
--- unread byte in `s`.
---
--- @param fmt  string
--- @param s    string
--- @param pos? integer
---
--- @return any ...
--- @return integer offset
function string.unpack(fmt, s, pos) end

--- Backported from Lua 5.4, see https://www.lua.org/manual/5.4/manual.html#6.4.2
---
--- Returns the size of a string resulting from `string.pack` with the given
--- format. The format string cannot have the variable-length options '`s`' or '`z`'
---
--- @param fmt string
---
--- @return integer
function string.packsize(fmt) end
