return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "LspAttach",
  lazy = false,
  config = function()
    require('tiny-inline-diagnostic').setup({
      options = {
        preset = 'powerline',
        multilines = {
          enabled = true,
          always_show = true,
        },
        enable_on_insert = true,
        throttle = 0,
      }
    })
    vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
  end
}
