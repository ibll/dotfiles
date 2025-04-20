return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  -- refer to `:h file-pattern` for more examples
  --   "BufReadPre /Users/isbell/Library/Mobile Documents/iCloud~md~obsidian/Documents/*.md",
  --   "BufNewFile /Users/isbell/Library/Mobile Documents/iCloud~md~obsidian/Documents/*.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "Personal",
        path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Vault/",
      },
    },

    daily_notes = {
      folder = "Life/",
      date_format = "%Y/%m-%B/%Y-%m-%d",
      template = "Daily Notes Template.md",
    },

    templates = {
      folder = "Templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
    },

    picker = {
      -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
      name = "snacks.pick",
      note_mappings = {
        new = "<C-x>",
        insert_link = "<C-l>",
      },
    },

    completion = {
      blink = true,
      min_chars = 2,
    },

    open_app_foreground = true,
    disable_frontmatter = true,
  },
}
