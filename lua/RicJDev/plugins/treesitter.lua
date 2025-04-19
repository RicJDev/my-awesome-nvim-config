return {
  "nvim-treesitter/nvim-treesitter",
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
}
