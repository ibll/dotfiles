-- https://neovide.dev/configuration.html
if vim.g.neovide then
  vim.g.neovide_input_macos_option_key_is_meta = "only_left"
  vim.g.neovide_hide_mouse_when_typing = true

  vim.g.neovide_floating_shadow = false

  vim.g.neovide_cursor_animation_length = 0.100
  vim.g.neovide_cursor_trail_size = 0.50
  -- vim.g.neovide_theme = "auto" -- auto dark-light mode is broken
end
