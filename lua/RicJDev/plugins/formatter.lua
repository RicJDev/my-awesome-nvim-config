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
      ft_parsers = {
        astro = "astro",
      },
      ext_parsers = {
        astro = "astro",
      },
    },
  },
  config = function()
    require("conform").setup {
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        astro = { "prettier" },
        python = {
          "autopep8",
          lsp_format = "fallback",
        },
      },
      formatters = {},
    }
  end,
}
