--- @meta

-- ---------
-- # Server:
-- ---------


--- Request for
---   server shutdown. Will display `message` to clients.
--- * `reconnect` == true displays a reconnect button
--- * `delay` adds an optional delay (in seconds) before shutdown.
---   Negative delay cancels the current active shutdown.
---   Zero delay triggers an immediate shutdown.
---
function core.request_shutdown(message,reconnect,delay) end

--- Cancel current delayed shutdown
---
function core.cancel_shutdown_requests() end

--- * Returns the server status string when a player joins or when the command
---   `/status` is called. Returns `nil` or an empty string when the message is
---   disabled.
--- * `joined`: Boolean value, indicates whether the function was called when
---   a player joined.
--- * This function may be overwritten by mods to customize the status message.
---
function core.get_server_status(name, joined) end

--- Returns the server uptime in seconds
---
function core.get_server_uptime() end

--- Remove player from database (if they are not
---   connected).
--- * As auth data is not removed, `core.player_exists` will continue to
---   return true. Call the below method as well if you want to remove auth
---   data too.
--- * Returns a code (0: successful, 1: no such player, 2: player is connected)
---
function core.remove_player(name) end

--- Remove player authentication data
--- * Returns boolean indicating success (false if player nonexistant)
---
function core.remove_player_auth(name) end

--- * `filepath`: path to a media file on the filesystem
--- * `callback`: function with arguments `name`, where name is a player name
---   (previously there was no callback argument; omitting it is deprecated)
--- * Adds the file to the media sent to clients by the server on startup
---   and also pushes this file to already connected clients.
---   The file must be a supported image, sound or model format. It must not be
---   modified, deleted, moved or renamed after calling this function.
---   The list of dynamically added media is not persisted.
--- * Returns false on error, true if the request was accepted
--- * The given callback will be called for every player as soon as the
---   media is available on the client.
---   Old clients that lack support for this feature will not see the media
---   unless they reconnect to the server. (callback won't be called)
--- * Since media transferred this way currently does not use client caching
---    or HTTP transfers, dynamic media should not be used with big files.
---
function core.dynamic_add_media(filepath, callback) end
