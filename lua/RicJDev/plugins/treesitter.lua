return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,

  build = ":TSUpdate",
  opts = {
    install = {
      compilers = { "zig", "gcc" },
    },
    highlight = {
      enable = true,
      use_languagetree = true,
    },
    indent = { enable = true },
  },
}
