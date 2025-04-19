return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {},
  config = function()
    require("toggleterm").setup {
      size = 20,
      open_mapping = [[<A-i>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "float",
      close_on_exit = true,
      shell = 'PowerShell',-- vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },

      on_open = function(term)
        vim.cmd "startinsert!"
        vim.api.nvim_buf_set_keymap(term.bufnr, "i", "<A-i>", "<cmd>close<CR>", { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<A-i>", "<cmd>close<CR>", { noremap = true, silent = true })
      end,
    }
  end,
}
