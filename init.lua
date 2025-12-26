vim.g.nofsync = true

require('RicJDev')
require('RicJDev.lsp')

require 'nvim-treesitter.install'.compilers = { "zig", "gcc" }
vim.diagnostic.config {
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "✘",
      [vim.diagnostic.severity.WARN] = "▲",
      [vim.diagnostic.severity.HINT] = "⚑",
      [vim.diagnostic.severity.INFO] = "»",
    },
  },
}
