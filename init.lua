vim.opt.hlsearch = false
vim.g.mapleader = ' '

if vim.g.vscode then
  local vscode = require('vscode')
  local k = vim.keymap.set
  k("n", "]d", function() vscode.action("editor.action.marker.next") end, { noremap = true })
  k("n", "[d", function() vscode.action("editor.action.marker.prev") end, { noremap = true })
  k("n", "<leader>r", function() vscode.action("editor.action.rename") end, { noremap = true })
  k("n", "<leader>l", function() vscode.action("codelens.showLensesInCurrentLine") end, { noremap = true })
  k("n", "<leader>d", function() vscode.action("editor.debug.action.toggleBreakpoint") end, { noremap = true })
else
  -- ordinary Neovim
end
