-- Just an example, supposed to be placed in /lua/custom/
local userPlugins = require "custom.plugins"

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.plugins = {
  options = {
},

  user = userPlugins,
}

M.ui = {
   theme = "catppuccin",
}

return M

