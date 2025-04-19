return {
  "lukas-reineke/indent-blankline.nvim",
<<<<<<< HEAD
  main = "ibl",
  opts = {},
  config = function()
    require("ibl").setup {
      scope = { enabled = false },
    }
  end,
=======
  -- lazy = true,
  main = "ibl",
  opts = {},
  config = function ()
    -- local highlight = {
    --   "CursorColumn",
    --   "Whitespace",
    -- }
    --

    require("ibl").setup {
    --   indent = { highlight = highlight, char = "" },
    --   whitespace = {
    --     highlight = highlight,
    --     remove_blankline_trail = false,
    --   },

      scope = { enabled = false },
    }
  end
>>>>>>> 12e4baf242a275f5891307ac8d5342d881aa6d1e
}
