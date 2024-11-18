-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.opt.hlsearch = false
vim.opt.clipboard = "unnamedplus"
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('lazy').setup({
  {
    'vscode-neovim/vscode-multi-cursor.nvim',
    event = 'VeryLazy',
    cond = not not vim.g.vscode,
    opts = {},
  },
  {
    "folke/flash.nvim",
    event = 'VeryLazy',
    opts = {
      modes = {
        search = {
          enabled = true
        }
      }
    },
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  { "chrisgrieser/nvim-spider", lazy = true },
})

require('spider').setup({
  skipInsignificantPunctuation = false
})

if vim.g.vscode then
  local vscode = require('vscode')
  local cursors = require('vscode-multi-cursor')
  cursors.setup {
    default_mappings = true,
    no_selection = false
  }
  local k = vim.keymap.set

  local function jw(f)
    return function()
      vscode.call('jumplist.registerJump')
      f()
    end
  end

  k('n', 'gb', function() vscode.action('breadcrumbs.focusAndSelect') end, { noremap = true })
  k('n', ']d', function() vscode.action('editor.action.marker.next') end, { noremap = true })
  k('n', '[d', function() vscode.action('editor.action.marker.prev') end, { noremap = true })
  k('n', '<leader>l', function() vscode.action('codelens.showLensesInCurrentLine') end, { noremap = true })
  k('n', '<leader>d', function() vscode.action('editor.debug.action.toggleBreakpoint') end, { noremap = true })
  k('n', '<leader>r', function() vscode.action('editor.action.rename') end, { noremap = true })
  k({ 'n', 'x' }, '<c-k>', function() vscode.action('editor.action.smartSelect.expand') end, { noremap = true })
  k({ 'n', 'x' }, '<c-j>', function() vscode.action('editor.action.smartSelect.shrink') end, { noremap = true })
  k({ 'n', 'x', 'i' }, "<C-d>", function() cursors.addSelectionToNextFindMatch() end)

  k('n', '<CR>', 'o<Esc>', { noremap = true })
  k('n', 'H', '^', { noremap = true })
  k('n', 'L', '$', { noremap = true })
  k({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
  k({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
  k({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })

  k({ 'n', 'x' }, 'gd', jw(function() vscode.action('editor.action.revealDefinition') end), { noremap = true })
  k({ 'n', 'x' }, 'gr', jw(function() vscode.action('editor.action.goToReferences') end), { noremap = true })
  k({ 'n', 'x' }, '<C-]>', jw(function() vscode.action('editor.action.revealDefinition') end), { noremap = true })
  k({ 'n', 'x', 'o' }, 's', jw(function() require('flash').jump() end), { noremap = true })
  k({ 'n', 'x' }, '<c-o>', function() vscode.action('jumplist.jumpBack') end, { noremap = true })
  k({ 'n', 'x' }, '<c-i>', function() vscode.action('jumplist.jumpForward') end, { noremap = true })
else
  -- ordinary Neovim
end
