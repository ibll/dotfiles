return {
  "ii14/neorepl.nvim",
  config = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "neorepl" },
      callback = function()
        vim.b.completion = false
      end,
    })
  end,
}
