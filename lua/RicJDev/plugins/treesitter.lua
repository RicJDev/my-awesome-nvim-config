return {
  "nvim-treesitter/nvim-treesitter",
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
}
