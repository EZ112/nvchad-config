---@type ChadrcConfig
local M = {}
M.ui = {
  theme = "github_dark",
  hl_override = { Comment = { fg = "green" }, ["@comment"] = { fg = "green" } },
  transparency = true,
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
return M
