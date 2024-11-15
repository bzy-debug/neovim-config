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
    opts = {},
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  }
})

if vim.g.vscode then
  local vscode = require('vscode')
  local cursors = require('vscode-multi-cursor')
  cursors.setup {
    default_mappings = true,
    no_selection = false
  }
  local k = vim.keymap.set
  k("n", "]d", function() vscode.action("editor.action.marker.next") end, { noremap = true })
  k("n", "[d", function() vscode.action("editor.action.marker.prev") end, { noremap = true })
  k("n", "<leader>r", function() vscode.action("editor.action.rename") end, { noremap = true })
  k("n", "<leader>l", function() vscode.action("codelens.showLensesInCurrentLine") end, { noremap = true })
  k("n", "<leader>d", function() vscode.action("editor.debug.action.toggleBreakpoint") end, { noremap = true })
  k('n', '<S-m>', 'mciw*', { remap = true })
else
  -- ordinary Neovim
end
