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

vim.api.nvim_create_augroup("JSLogMacro", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = "JSLogMacro",
  pattern = { "javascript", "typescript" },
  callback = function()
    vim.fn.setreg("l", vim.api.nvim_replace_termcodes("yoconsole.log('<Esc>pa:<Esc>la, <Esc>p1", true, true, true))
  end,
})

vim.api.nvim_create_augroup("PythonLogMacro", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = "PythonLogMacro",
  pattern = { "python" },
  callback = function()
    vim.fn.setreg("l", vim.api.nvim_replace_termcodes('yoprint("<Esc>pa:", <Esc>pa)<Esc>1', true, true, true))
  end,
})

vim.api.nvim_create_augroup("CppLogMacro", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = "CppLogMacro",
  pattern = { "cpp" },
  callback = function()
    vim.fn.setreg(
      "l",
      vim.api.nvim_replace_termcodes('yostd::cout << "<Esc>pa:" << <Esc>pa << std::endl;<Esc>1', true, true, true)
    )
  end,
})

vim.api.nvim_create_augroup("LuaLogMacro", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = "LuaLogMacro",
  pattern = { "lua" },
  callback = function()
    vim.fn.setreg("l", vim.api.nvim_replace_termcodes("yoprint('<Esc>pa:', <Esc>p1)<Esc>1", true, true, true))
  end,
})
