return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup {
      formatters_by_ft = {
        lua = { "stylua", lsp_format = "fallback" },
        javascript = { "prettier", stop_after_first = true, lsp_format = "fallback" },
      },
    }
  end,
}
