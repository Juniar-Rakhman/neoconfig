local M = {}

function M.setup()
	-- pcall is used to prevent errors of requiring non existent module or module with syntax error
  local status_ok, neogit = pcall(require, "neogit")
  if not status_ok then
    return
  end

  neogit.setup {}
end

return M
