return {
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    config = function()
      require("onedarkpro").setup {
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
          -- terminal_colors = false,
        },
      }
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup {
        no_italic = true,
        transparent_background = true,
      }
    end,
  },
}
