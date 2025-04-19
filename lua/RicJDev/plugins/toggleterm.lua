local HEIGHT_RATIO = 0.4
local WIDTH_RATIO = 0.6

local screen_w = vim.opt.columns:get()
local window_w = screen_w * WIDTH_RATIO
local window_w_int = math.floor(window_w)

local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
local window_h = screen_h * HEIGHT_RATIO
local window_h_int = math.floor(window_h)

local center_x = (screen_w - window_w) / 2
local center_y = ((vim.opt.lines:get() - window_h * 2) / 2) - vim.opt.cmdheight:get()

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
      shell = 'PowerShell', -- vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 0,
        width = window_w_int,
        heiht = window_h_int,
        row = center_y,
        col = center_x,
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
