local servers = {
  "powershell_es",
  "jsonls",
  "lua_ls",
  "basedpyright",
  "astro",
  "ts_ls",
  "html",
  "cssls",
  "emmet_ls",
  "gopls",
  "clangd",
  "rust_analyzer",
}

for _, server in ipairs(servers) do
  vim.lsp.enable(server)
end
