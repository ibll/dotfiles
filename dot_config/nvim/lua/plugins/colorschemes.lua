return {
  -- Set Default
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
  -- Neovide auto-detect colour change is broken
  {
    "f-person/auto-dark-mode.nvim",
    opts = {},
  },
  -- Colourschemes ↓
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "auto",
      background = {
        light = "latte",
        dark = "mocha",
      },
      transparent_background = true,
    },
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
  },
}
