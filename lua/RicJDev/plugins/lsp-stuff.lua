return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    priority = 200,
  },
  -- {
  --   "mason-org/mason.nvim",
  --   opts = {},
  -- },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      {
        "mason-org/mason.nvim", opts = {}
      },
      "neovim/nvim-lspconfig",
    },
  }
}
