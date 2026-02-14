vim.cmd [[
  set nowrap
  set guicursor=n-v-c-i:block
  set linebreak
  colorscheme onedark
]]

vim.api.nvim_create_user_command("BufOnly", function()
  vim.cmd "%bd|e#|bd#"
end, {})

-------------------------------------- options ------------------------------------------
vim.o.laststatus = 3
vim.o.showmode = false

vim.o.clipboard = "unnamedplus"
vim.o.cursorline = true
vim.o.cursorlineopt = "both"

-- Indenting
vim.o.expandtab = true
vim.o.smartindent = true

vim.opt.fillchars = { eob = " " }
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.mouse = "a"

-- Numbers
vim.o.number = true
vim.o.relativenumber = true
vim.o.numberwidth = 2
vim.o.ruler = false

-- Virtual column
vim.opt.colorcolumn = "80"

-- disable nvim intro
vim.opt.shortmess:append "sI"

vim.o.foldenable = true
vim.o.foldlevelstart = 99
vim.o.signcolumn = "yes"
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.timeoutlen = 400
vim.o.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
vim.o.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
vim.opt.whichwrap:append "<>[]hl"

-- disable some default providers
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

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
vim.opt.signcolumn = "yes"
vim.opt.swapfile = false
