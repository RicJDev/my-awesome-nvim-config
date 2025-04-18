return {
  "neovim/nvim-lspconfig",
  lazy = false,
  priority = 2000,

  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "j-hui/fidget.nvim",
  },
  config = function()
    local cmp_lsp = require "cmp_nvim_lsp"
    local capabilities =
      vim.tbl_deep_extend("force", {}, cmp_lsp.default_capabilities(), vim.lsp.protocol.make_client_capabilities())

    require("fidget").setup {}
    require("mason").setup()

    require("mason-lspconfig").setup {
      ensure_installed = {
        "ts_ls",
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
        ts_ls = function()
          require("lspconfig").ts_ls.setup {
            capabilities = capabilities,
            -- settings = {
            --   cmd = { "typescript-language-server", "--stdio" },
            --   completions = {
            --     completeFunctionCalls = true,
            --   },
            --   filetypes = {
            --     "javascript",
            --     "javascriptreact",
            --     "typescript",
            --     "typescriptreact",
            --   },
            -- },
          }
        end,
        html = function()
          require("lspconfig").html.setup {
            capabilities = capabilities,
            init_options = {
              configurationSection = { "html", "css", "javascript" },
              embeddedLanguages = {
                css = true,
                javascript = true,
              },
              provideFormatter = true,
            },
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
      },
    }

    local cmp = require "cmp"

    -- this is the function that loads the extra snippets to luasnip
    -- from rafamadriz/friendly-snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup {
      sources = {
        { name = "path" },
        { name = "nvim_lsp" },
        { name = "luasnip", keyword_length = 2 },
        { name = "buffer", keyword_length = 3 },
      },
      mapping = cmp.mapping.preset.insert {
        ["<CR>"] = cmp.mapping.confirm { select = true },
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
  end,
}
