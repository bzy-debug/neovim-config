require'nvim-tree'.setup ()

require'nvim-treesitter.configs'.setup {
  highlight = { enable = true, disable = {'scheme'} },
  indent = { enable = true }
}

require'lightspeed'.setup {}

require'which-key'.setup {}

require'telescope'.setup {}

require('lspfuzzy').setup {}

-- require('nvim_comment').setup()
