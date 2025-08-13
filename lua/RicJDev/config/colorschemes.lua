require("onedarkpro").setup {
  highlights = {
    Comment = { italic = false },
  },
  styles = {
    keywords = "bold",
  },
  plugins = {
    nvim_tree = false,
    neo_tree = false,
  },
  options = {
    cursorline = true,
    transparency = true,
  },
}

require("catppuccin").setup {
  no_italic = true,
  transparent_background = true,
}
