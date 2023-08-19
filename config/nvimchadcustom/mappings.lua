---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
  i = {
    ["jk"] = {"<ESC>:w<CR>"}
  }
}

-- more keybinds!

return M
