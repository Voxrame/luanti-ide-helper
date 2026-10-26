--- @meta

-- ---------
-- # Timing:
-- ---------


--- Returns job table to use as below.
--- * Call the function `func` after `time` seconds, may be fractional
--- * Optional: Variable number of arguments that are passed to `func`
---
---@param time number @in seconds
---@param func fun()
---@return job @job (job:cancel() to stop)
function core.after(time, func, ...) end

--- * Cancels the job function from being called
function job:cancel() end
