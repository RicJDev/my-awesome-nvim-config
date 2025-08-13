-- Lualine
require('lualine').setup {
  options = { theme  = 'horizon'},
}

-- Neo Tree
require("neo-tree").setup {
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_hidden = false,
      hide_by_name = {
        ".git",
        "node_modules",
      },
    },
    hijack_netrw_behavior = "disabled",
  },
}

