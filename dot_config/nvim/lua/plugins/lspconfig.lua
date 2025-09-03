return {
  "neovim/nvim-lspconfig",
  config = function()
    local port = tonumber(os.getenv("GDScript_Port") or "6005")

    require("lspconfig").gdscript.setup({
      name = "godot",
      cmd = vim.lsp.rpc.connect("127.0.0.1", port),
    })
  end,
}
