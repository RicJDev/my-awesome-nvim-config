return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    priority = 200,
  },
  {
    'simrat39/rust-tools.nvim',
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = {},
      },
      "neovim/nvim-lspconfig",
    },
  },
}
