return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      gdscript = {},
    },
    setup = {

      gdscript = function(_, opts)
        -- GODOT SETTINGS
        --
        -- text_editor/behavior/files/auto_reload_scripts_on_external_change
        --     true
        -- text_editor/external/exec_path
        --     /opt/homebrew/bin/nvim
        -- text_editor/external/exec_flags
        --     --server /tmp/godot.pipe --remote-send "<esc>:n {file}<CR>:call cursor({line}+1,{col})<CR>"
        -- text_editor/external/use_external_editor
        --    true

        require("lspconfig")["gdscript"].setup({
          name = "godot",
          cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
          on_init = function(client, init_result)
            vim.fn.serverstart("/tmp/godot.pipe")
          end,
        })
        return true
      end,
    },
  },
}
