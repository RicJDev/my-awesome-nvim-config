return {
  "stevearc/conform.nvim",
  opts = {
    prettier = {
      config_command = "--config",
      config_names = {
        ".prettierrc",
        ".prettierrc.json",
        ".prettierrc.yml",
        ".prettierrc.yaml",
        ".prettierrc.json5",
        ".prettierrc.js",
        ".editorconfig",
      },
      config_path = ".prettierrc.json",
    }
  },
  config = function()
    require("conform").setup {
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettier", lsp_fallback = true },
        typescript = { "prettier", lsp_fallback = true },
        javascriptreact = { "prettier", lsp_fallback = true },
        typescriptreact = { "prettier", lsp_fallback = true },
        json = { "prettier", lsp_fallback = true },
        html = { "prettier", lsp_fallback = true },
        css = { "prettier", lsp_fallback = true },
      },
      formatters = {
        prettier = {
          append_args = {
            "--print-width=120",
            "--trailing-comma=none",
            "--bracket-same-line=true",
            "--single-quote",
            "--no-semi",
          },
        },
      },
    }
  end,
}
