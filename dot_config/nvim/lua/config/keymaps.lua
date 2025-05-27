-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local allModes = { "n", "v", "s", "o", "i", "c", "x" }

-- Easy $ and ^
vim.keymap.set("n", "H", "^", { noremap = true, silent = true, desc = "Go to Start" })
vim.keymap.set("n", "L", "$", { noremap = true, silent = true, desc = "Go to End" })

-- Comment and duplicate. Count is for how many lines to copy
vim.keymap.set("n", "gcd", function()
  return "yy" .. vim.v.count1 .. "gcc']p"
end, { remap = true, expr = true, desc = "Comment and Duplicate" })

-- Search only within visual selection
vim.keymap.set("x", "/", "<Esc>/\\%V", { desc = "Search in Selection" })
vim.keymap.set("x", "?", "<Esc>?\\%V", { desc = "Search backwards in Selection" })

-- Add punctuation to end of line
vim.keymap.set("i", ";;", "<ESC>A;")
vim.keymap.set("i", ",,", "<ESC>A,")

-- Tab does indent
-- vim.keymap.set("i", "<Tab>", "<C-o>>><C-o>A")
-- vim.keymap.set("i", "<S-Tab>", "<C-o><<<C-o>A")

-- Block insert in line visual mode
vim.keymap.set("x", "I", function()
  return vim.fn.mode() == "V" and "^<C-v>I" or "I"
end, { expr = true })
vim.keymap.set("x", "A", function()
  return vim.fn.mode() == "V" and "$<C-v>A" or "A"
end, { expr = true })

-- map cmd+arrow keys to window size control in normal mode
vim.keymap.set("n", "<D-LEFT>", "<C-w>2<")
vim.keymap.set("n", "<D-DOWN>", "<C-w>2-")
vim.keymap.set("n", "<D-UP>", "<C-w>2+")
vim.keymap.set("n", "<D-RIGHT>", "<C-w>2>")

-- Shift O is redo
vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })
