return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
    "j-hui/fidget.nvim",
  },
  config = function()
    local cmp_lsp = require "cmp_nvim_lsp"
    local capabilities =
      vim.tbl_deep_extend("force", {}, cmp_lsp.default_capabilities(), vim.lsp.protocol.make_client_capabilities())

    require("fidget").setup()
    require("mason").setup()

    require("mason-lspconfig").setup {
      ensure_installed = {
        "ts_ls",
        "emmet_ls",
        "lua_ls",
        "html",
        "cssls",
      },
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup {
            capabilities = capabilities,
          }
        end,
        lua_ls = function()
          require("lspconfig").lua_ls.setup {
            capabilities = capabilities,
            settings = {
              Lua = {
                runtime = {
                  version = "LuaJIT",
                },
                diagnostics = {
                  globals = { "vim", "love" },
                },
                workspace = {
                  library = {
                    vim.env.VIMRUNTIME,
                  },
                },
              },
            },
          }
        end,
        marksman = function()
          require("lspconfig").marksman.setup {
            capabilities = capabilities,
          }
        end,
        ts_ls = function()
          require("lspconfig").ts_ls.setup {
            capabilities = capabilities,
          }
        end,
        html = function()
          require("lspconfig").html.setup {
            capabilities = capabilities,
          }
        end,
        cssls = function()
          require("lspconfig").cssls.setup {
            capabilities = capabilities,
          }
        end,
        emmet_ls = function()
          require("lspconfig").emmet_ls.setup {
            capabilities = capabilities,
          }
        end,
        astro = function()
          require("lspconfig").astro.setup {
            capabilities = capabilities,
          }
        end,
        basedpyright = function()
          require("lspconfig").basedpyright.setup {
            capabilities = capabilities,
          }
        end,
        ruff = function()
          require("lspconfig").ruff.setup {
            capabilities = capabilities,
          }
        end,
        clangd = function()
          require("lspconfig").clangd.setup {
            capabilities = capabilities,
          }
        end,
        powershell_es = function()
          require("lspconfig").powershell_es.setup {
            capabilities = capabilities,
          }
        end,
        gopls = function()
          require("lspconfig").gopls.setup {
            capabilities = capabilities,
          }
        end,
      },
    }

    local cmp = require "cmp"

    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup {
      sources = {
        { name = "path" },
        { name = "nvim_lsp" },
        { name = "luasnip", keyword_length = 2 },
        { name = "buffer", keyword_length = 3 },
      },
      mapping = cmp.mapping.preset.insert {
        ["<CR>"] = cmp.mapping.confirm { select = true }, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { "i", "s" }),
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
    }

    vim.api.nvim_create_autocmd("LspAttach", {
      desc = "LSP actions",
      callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
        vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
      end,
    })

    vim.diagnostic.config {
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "✘",
          [vim.diagnostic.severity.WARN] = "▲",
          [vim.diagnostic.severity.HINT] = "⚑",
          [vim.diagnostic.severity.INFO] = "»",
        },
      },
    }
  end,
}
