-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

------------
-- Macros --
------------

-- local esc = vim.api.nvim_replace_termcodes("<Esc>", true, true, true)

vim.api.nvim_create_augroup("LogMacros", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = "LogMacros",
  pattern = { "javascript", "typescript" },
  callback = function()
    vim.fn.setreg("l", vim.api.nvim_replace_termcodes("yoconsole.log('<Esc>pa:<Esc>la, <Esc>p1", true, true, true))
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = "LogMacros",
  pattern = { "python" },
  callback = function()
    vim.fn.setreg("l", vim.api.nvim_replace_termcodes('yoprint("<Esc>pa:", <Esc>pa)<Esc>1', true, true, true))
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = "LogMacros",
  pattern = { "cpp" },
  callback = function()
    vim.fn.setreg(
      "l",
      vim.api.nvim_replace_termcodes('yostd::cout << "<Esc>pa:" << <Esc>pa << std::endl;<Esc>1', true, true, true)
    )
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = "LogMacros",
  pattern = { "lua" },
  callback = function()
    vim.fn.setreg("l", vim.api.nvim_replace_termcodes("yoprint('<Esc>pa:', <Esc>p1)<Esc>1", true, true, true))
  end,
})

---------------
-- Filetypes --
---------------

vim.api.nvim_create_autocmd("FileType", {
  pattern = "ron",
  callback = function()
    vim.o.commentstring = "// %s" -- Change this to your desired comment string
  end,
})

vim.api.nvim_create_autocmd("Filetype", {
  pattern = "markdown",
  callback = function()
    vim.b.completion = false
  end,
})

vim.api.nvim_create_autocmd("Filetype", {
  pattern = "javascript",
  callback = function()
    vim.opt.tabstop = 4 -- Number of spaces a <Tab> counts for
    vim.opt.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent
    vim.opt.expandtab = true -- Use spaces instead of tabs
    vim.opt.smartindent = true -- Enable smart indentation
  end,
})

listening_to_godot = false
vim.api.nvim_create_autocmd("Filetype", {
  pattern = "gdscript",
  callback = function()
    if listening_to_godot then
      return
    end

    local pipe = "/tmp/godot.pipe" -- I use /tmp/godot.pipe
    vim.api.nvim_command('echo serverstart("' .. pipe .. '")')
    listening_to_godot = true
  end,
})
