return {
  "snacks.nvim",
  opts = {
    dashboard = {
      -- dashboard configuration
      preset = {
        -- Rozzo typeface - https://patorjk.com/software/taag/#f=Rozzo&t=Neovim
        header = [[
                                    ,e,             
888 8e   ,e e,   e88 88e  Y8b Y888P  "  888 888 8e  
888 88b d88 88b d888 888b  Y8b Y8P  888 888 888 88b 
888 888 888   , Y888 888P   Y8b "   888 888 888 888 
888 888  "YeeP"  "88 88"     Y8P    888 888 888 888 
]],
      },
      sections = {
        { section = "header" },
        {
          { section = "keys", gap = 1, padding = 3 },
          { section = "startup", gap = 3 },
        },
      },
    },
    image = {
      doc = {
        inline = false,
        float = true,
        max_width = 30,
        max_height = 30,
      },
      math = {
        enabled = true,
      },
    },
  },
}
