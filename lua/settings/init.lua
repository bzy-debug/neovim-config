local set = vim.opt
local cmd = vim.cmd

set.expandtab = true
set.smarttab = true
set.shiftwidth = 2
set.tabstop = 2
set.mouse = 'a'

set.hlsearch = false
set.incsearch = true
set.ignorecase = true
set.smartcase = true

set.splitbelow = true
set.splitright = true
set.wrap = false
set.scrolloff = 5
set.fileencoding = 'utf-8'
set.termguicolors = true

set.number = true
set.cursorline = true

set.hidden = true

cmd [[
augroup NumberToggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END
]]

cmd [[
augroup YankHighlight
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank()
augroup END
]]

cmd [[
autocmd FileType ocaml,scheme,lisp inoremap <buffer> ' '
]]
