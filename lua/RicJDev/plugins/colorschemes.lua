local onedarkpro = require "RicJDev.config.onedarkpro"
local catppuccin = require "RicJDev.config.catppuccin"

return {
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    opts = onedarkpro,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = catppuccin,
  },
}
