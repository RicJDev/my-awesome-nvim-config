return {
  {
<<<<<<< HEAD
=======
    "norcalli/nvim-colorizer.lua",
    event = "BufEnter",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
>>>>>>> 12e4baf242a275f5891307ac8d5342d881aa6d1e
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
          -- transparency = true,
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
        -- transparent_background = true,
      }
    end,
  },
}
