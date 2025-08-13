require("nvim-treesitter.configs").setup {
  install = {
    compilers = { "zig" },
  },
  highlight = { enable = true },
  indent = { enable = true },
}
