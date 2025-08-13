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
      "lua",
      "vimdoc",
      "html",
      "css",
      "javascript",
      "typescript",
      "tsx",
    },
    highlight = {
      enable = true,
      use_languagetree = true,
    },
    indent = { enable = true },
  },
}
