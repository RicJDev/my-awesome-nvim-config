local onedarkpro = require "RicJDev.config.onedarkpro"
local catppuccin = require "RicJDev.config.catppuccin"

return {
  {
    "olimorris/onedarkpro.nvim",
    opts = {
      highlights = {
        Comment = { italic = false },
      },
      styles = {
        keywords = "bold",
      },
      plugins = {
        nvim_tree = false,
        neo_tree = false,
      },
      options = {
        cursorline = true,
        transparency = true,
      },
    }
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      no_italic = true,
      transparent_background = true,
    }
  },
}
