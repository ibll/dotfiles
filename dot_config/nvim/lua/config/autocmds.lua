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

vim.api.nvim_create_autocmd("Filetype", {
  pattern = "gdscript",
  callback = function()
    vim.opt.colorcolumn = "100"
  end,
})

-- Reuse or open a terminal in a vertical split (Neovim Lua)
local function open_or_reuse_terminal_vertical(cmd, name)
  -- Search for an existing terminal buffer with b:term_name == name
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_option(buf, "buftype") == "terminal" then
      local ok, val = pcall(vim.api.nvim_buf_get_var, buf, "term_name")
      if ok and val == name then
        -- If it's visible in another window, jump there; otherwise switch buffer in current window
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          if vim.api.nvim_win_get_buf(win) == buf then
            vim.api.nvim_set_current_win(win)
            vim.cmd("startinsert")
            return
          end
        end
        -- Not visible: open in a vertical split and set that buffer
        vim.cmd("vsplit")
        vim.api.nvim_win_set_buf(0, buf)
        vim.cmd("startinsert")
        return
      end
    end
  end

  -- None found: create new terminal in a vertical split
  vim.cmd("split")
  -- vim.cmd("vertical resize 60") -- adjust width as you like; comment out to keep default
  -- Use termopen so we get a buffer we can name
  local term_buf = vim.api.nvim_create_buf(false, true) -- not listed, scratch
  vim.api.nvim_set_current_buf(term_buf)
  vim.fn.termopen(cmd)
  vim.api.nvim_buf_set_var(term_buf, "term_name", name)
  vim.cmd("startinsert")
end

vim.api.nvim_create_autocmd("Filetype", {
  pattern = "sage",
  callback = function()
    vim.keymap.set("n", "<localleader>r", function()
      open_or_reuse_terminal_vertical(
        "sage " .. vim.fn.expand("%") .. "; rm " .. vim.fn.expand("%") .. ".py",
        "Sage Runner"
      )
    end, { noremap = true, silent = true, desc = "Run in Terminal" })
    vim.bo.commentstring = "# %s"
  end,
})
