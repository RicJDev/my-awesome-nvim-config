return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {},
  config = function()
    require("nvim-treesitter.configs").setup {
      install = {
        compilers = { "zig" }
      },
      highlight = { enable = true },
      indent = { enable = true },
    }
  end,
}
