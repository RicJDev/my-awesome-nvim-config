vim.cmd [[
  set nowrap
  set guicursor=n-v-c-i:block
  set linebreak
  colorscheme onedark
  Copilot disable
]]

local opt = vim.opt
local o = vim.o
local g = vim.g
local wo = vim.wo

-------------------------------------- options ------------------------------------------
o.laststatus = 3
o.showmode = false

o.clipboard = "unnamedplus"
o.cursorline = true
o.cursorlineopt = "both"

-- Indenting
o.expandtab = true
o.smartindent = true

opt.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true
o.mouse = "a"

-- Numbers
o.number = true
o.numberwidth = 2
o.ruler = false

-- Virtual column
opt.colorcolumn = "80"

-- disable nvim intro
opt.shortmess:append "sI"

o.foldenable = true
o.foldlevelstart = 99
o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 400
o.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
o.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

-- disable some default providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- add binaries installed by mason.nvim to path
local is_windows = vim.fn.has "win32" ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
vim.env.PATH = table.concat({ vim.fn.stdpath "data", "mason", "bin" }, sep) .. delim .. vim.env.PATH

-- Archivos .gabo
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.gabo",
  callback = function(args)
    vim.bo[args.buf].filetype = "gabo"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*.gabo",
  callback = function(args)
    local bufnr = args.buf
    vim.bo[bufnr].shiftwidth = 2
    vim.bo[bufnr].tabstop = 2
    vim.bo[bufnr].softtabstop = 2
    vim.bo[bufnr].expandtab = true
    vim.bo[bufnr].commentstring = "// %s"

    vim.cmd "set syntax gabo"
  end,
})

-- Ehm... other stuff
opt.signcolumn = "yes"
opt.swapfile = false
wo.number = false
