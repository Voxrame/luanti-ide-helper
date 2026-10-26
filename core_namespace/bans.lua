--- @meta

-- -------
-- # Bans:
-- -------


--- Returns a list of all bans formatted as string
---
function core.get_ban_list() end

--- Returns list of bans matching
---   IP address or name formatted as string
---
function core.get_ban_description(ip_or_name) end

--- Ban the IP of a currently connected player
--- * Returns boolean indicating success
---
function core.ban_player(name) end

--- Remove ban record matching
---   IP address or name
---
function core.unban_player_or_ip(ip_or_name) end

--- Disconnect a player with an optional
---   reason.
--- * Returns boolean indicating success (false if player nonexistant)
---
function core.kick_player(name, reason) end
