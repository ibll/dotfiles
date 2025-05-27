return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function()
    -- PERF: we don't need this lualine require madness 🤷
    local lualine_require = require("lualine_require")
    lualine_require.require = require

    local icons = LazyVim.config.icons

    vim.o.laststatus = vim.g.lualine_laststatus

    local opts = {
      options = {
        theme = "auto",
        globalstatus = vim.o.laststatus == 3,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
        always_show_tabline = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          {
            "branch",
            on_click = function()
              Snacks.lazygit({ cwd = LazyVim.root.git() })
            end,
          },
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
            on_click = function(_, button)
              if button == "l" then
                vim.diagnostic.jump({ count = 1, float = true })
              elseif button == "r" then
                vim.diagnostic.jump({ count = -1, float = true })
              end
            end,
          },
        },
        lualine_c = {
          LazyVim.lualine.root_dir(),
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { LazyVim.lualine.pretty_path() },
        },
        lualine_x = {
          Snacks.profiler.status(),
          -- stylua: ignore
          {
            function() return require("noice").api.status.command.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            color = function() return { fg = Snacks.util.color("Statement") } end,
          },
          -- stylua: ignore
          {
            function() return require("noice").api.status.mode.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
            color = function() return { fg = Snacks.util.color("Constant") } end,
          },
          -- stylua: ignore
          {
            function()
              local visual_modes = {
                v = true, -- Visual charwise
                V = true, -- Visual linewise
                ["\22"] = true, -- Visual blockwise (CTRL+V)
              }
              local wc = vim.fn.wordcount()
              local words = visual_modes[vim.api.nvim_get_mode()["mode"]] and wc.visual_words or wc.words
              return words .. (words == 1 and " word " or " words")
            end,
            cond = function()
              return vim.bo.filetype == "markdown" or vim.bo.filetype == "asciidoc"
            end,
          },
          {
            function()
              return "  " .. require("dap").status()
            end,
            cond = function()
              return package.loaded["dap"] and require("dap").status() ~= ""
            end,
            color = function()
              return { fg = Snacks.util.color("Debug") }
            end,
            on_click = function(_, button)
              if button == "l" then
                require("dap").step_over()
              elseif button == "r" then
                require("dap").continue()
              end
            end,
          },
          -- stylua: ignore
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = function() return { fg = Snacks.util.color("Special") } end,
            on_click = function () require("lazy").show() end,
          },
        },
        lualine_y = {
          {
            "diff",
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
          },
          -- {
          --   "lsp_status",
          --   on_click = function()
          --     Snacks.picker.lsp_config()
          --   end,
          -- },
          {
            "searchcount",
          },
        },
        lualine_z = {
          { "location", padding = { left = 1, right = 1 } },
          { "progress", separator = " ", padding = { left = 1, right = 1 } },
        },
      },
      tabline = {
        lualine_a = {
          {
            "buffers",
            use_mode_colors = true,
            symbols = {
              alternate_file = "",
            },
            filetype_names = {
              ["copilot-chat"] = "Copilot Chat",
              lazy = "Lazy",
              snacks_dashboard = "Dashboard",
              snacks_picker_input = "Picker",
              snacks_picker_list = "Explorer",
              trouble = "Trouble",
            },
          },
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {
          {
            function()
              return " " .. os.date("%R")
            end,
          },
        },
        lualine_z = {
          {
            "tabs",
            show_modified_status = false,
            cond = function()
              return #vim.api.nvim_list_tabpages() > 1
            end,
          },
        },
      },
      winbar = {},
      extensions = { "neo-tree", "lazy", "fzf" },
    }

    -- do not add trouble symbols if aerial is enabled
    -- And allow it to be overriden for some buffer types (see autocmds)
    if vim.g.trouble_lualine and LazyVim.has("trouble.nvim") then
      local trouble = require("trouble")
      local symbols = trouble.statusline({
        mode = "symbols",
        groups = {},
        title = false,
        filter = { range = true },
        format = "{kind_icon}{symbol.name:Normal}",
        hl_group = "lualine_c_normal",
      })
      table.insert(opts.sections.lualine_c, {
        symbols and symbols.get,
        cond = function()
          return vim.b.trouble_lualine ~= false and symbols.has()
        end,
      })
    end

    return opts
  end,
}
