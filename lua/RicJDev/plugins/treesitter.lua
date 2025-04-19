return {
  "nvim-treesitter/nvim-treesitter",
<<<<<<< HEAD
  build = ":TSUpdate",
  opts = {},
  config = function()
    require("nvim-treesitter.configs").setup {
      install = {
        compilers = { "zig", "gcc", "clang", "cl", "cc" },
      },
      -- ensure_installed = {
      --   "javascript",
      --   "typescript",
      --   "lua",
      --   "html",
      --   "css",
      -- },
      highlight = { enable = true },
      indent = { enable = true },
    }
  end,
=======
  lazy = false,

  build = ":TSUpdate",
  opts = {
    install = {
      compilers = { vim.fn.getenv "CC", "zig", "gcc" },
    },
    ensure_installed = {
      "vim",
      "javascript",
      "typescript",
      "lua",
      "vimdoc",
      "html",
      "css",
      "tsx",
    },
    highlight = {
      enable = true,
      use_languagetree = true,
    },
    indent = { enable = true },
  },
>>>>>>> 12e4baf242a275f5891307ac8d5342d881aa6d1e
}
