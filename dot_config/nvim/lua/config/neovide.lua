-- https://neovide.dev/configuration.html
if vim.g.neovide then
  vim.g.neovide_input_macos_option_key_is_meta = "only_left"
  vim.g.neovide_hide_mouse_when_typing = true

  vim.g.neovide_floating_shadow = false

  vim.g.neovide_cursor_animation_length = 0.100
  vim.g.neovide_cursor_trail_size = 0.50
  -- vim.g.neovide_theme = "auto" -- auto dark-light mode is broken

  local allModes = { "n", "v", "s", "o", "i", "c", "x" }

  -- Zooming in and out
  vim.keymap.set(allModes, "<D-=>", function()
    vim.g.neovide_scale_factor = math.min(vim.g.neovide_scale_factor + 0.1, 2.0)
  end, { silent = true })

  vim.keymap.set(allModes, "<D-->", function()
    vim.g.neovide_scale_factor = math.max(vim.g.neovide_scale_factor - 0.1, 0.1)
  end, { silent = true })

  vim.keymap.set(allModes, "<D-0>", function()
    vim.g.neovide_scale_factor = 1.0
  end, { silent = true })
end
