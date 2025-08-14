return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "LspAttach",
  lazy = false,
  config = function()
    require('tiny-inline-diagnostic').setup({
      options = {
        preset = 'powerline',
        multilines = {},
        enable_on_insert = true,
        throttle = 0,
      }
    })
    vim.diagnostic.config({ virtual_text = false })
  end
}
