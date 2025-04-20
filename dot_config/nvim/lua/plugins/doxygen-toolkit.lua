return {
  "vim-scripts/DoxygenToolkit.vim",
  config = function()
    vim.g.DoxygenToolkit_authorName = "Your Name"
    vim.g.DoxygenToolkit_briefTag_pre = "@brief "
    vim.g.DoxygenToolkit_paramTag_pre = "@param "
    vim.g.DoxygenToolkit_returnTag = "@return "
  end,
}
