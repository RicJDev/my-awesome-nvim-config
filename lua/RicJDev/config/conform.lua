require("conform").setup {
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
  },
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettier", lsp_fallback = true },
    typescript = { "prettier", lsp_fallback = true },
    javascriptreact = { "prettier", lsp_fallback = true },
    typescriptreact = { "prettier", lsp_fallback = true },
    json = { "prettier", lsp_fallback = true },
    html = { "prettier", lsp_fallback = true },
    css = { "prettier", lsp_fallback = true },
    astro = { lsp_fallback = true },
  },
  formatters = {},
}
