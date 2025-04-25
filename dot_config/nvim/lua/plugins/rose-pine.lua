return {
  "rose-pine/neovim",
  name = "rose-pine",
  config = function()
    -- This can go in your color scheme or in your plugin config
    vim.api.nvim_set_hl(0, "VisualNonText", { fg = "#5D5F71", bg = "#FFFFFF" })
  end,
}
