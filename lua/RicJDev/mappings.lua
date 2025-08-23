local map = vim.keymap.set

-- File tree

map("n", "<C-n>", "<cmd>Neotree position=float toggle<CR>", { desc = "Neotree toggle window" })
map("n", "<leader>e", "<cmd>Neotree action=focus<CR>", { desc = "Neotree focus window" })

-- Some basic keymaps

map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })
map({ "n", "x", "i" }, "<F3>", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "general format file" })
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })
map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })

map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

map("n", ";", ":", { desc = "CMD enter command mode" })

-- Buffer navigation

map("n", "<Tab>", "<CMD>bNext<CR>", { desc = "change to next buffer" })
map("n", "<S-Tab>", "<CMD>bprevious<CR>", { desc = "change to previous buffer" })

-- Telescope

local builtin = require "telescope.builtin"

map("n", "<C-p>", builtin.find_files, {})
map("n", "<leader>fg", builtin.live_grep, {})
map("n", "<leader><leader>", builtin.oldfiles, {})

map("n", "K", vim.lsp.buf.hover, {})
