return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
  },
  config = function()
    -- Prevent DAP UI from hiding when finished
    local dap = require("dap")
    -- local dapui = require("dapui")
    dap.listeners.before.event_terminated["dapui_config"] = function()
      -- dapui.close({})
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      -- dapui.close({})
    end
  end,
}
