return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
  },
  config = function()
    -- load mason-nvim-dap here, after all adapters have been setup
    if LazyVim.has("mason-nvim-dap.nvim") then
      require("mason-nvim-dap").setup(LazyVim.opts("mason-nvim-dap.nvim"))
    end

    vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

    for name, sign in pairs(LazyVim.config.icons.dap) do
      sign = type(sign) == "table" and sign or { sign }
      vim.fn.sign_define(
        "Dap" .. name,
        { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
      )
    end

    -- setup dap config by VsCode launch.json file
    local vscode = require("dap.ext.vscode")
    local json = require("plenary.json")
    vscode.json_decode = function(str)
      return vim.json.decode(json.json_strip_comments(str))
    end

    -- Prevent DAP UI from hiding when finished
    local dap = require("dap")
    -- local dapui = require("dapui")
    dap.listeners.before.event_terminated["dapui_config"] = function()
      -- dapui.close({})
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      -- dapui.close({})
    end

    dap.adapters.godot = {
      type = "server",
      host = "127.0.0.1",
      port = 6006,
    }

    dap.configurations.gdscript = {
      {
        type = "godot",
        request = "launch",
        name = "Launch scene",
        project = "${workspaceFolder}",
        launch_scene = true,
      },
    }
  end,
}
