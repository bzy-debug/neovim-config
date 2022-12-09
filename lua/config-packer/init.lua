return require'packer'.startup(function()
  use 'wbthomason/packer.nvim'
  use "EdenEast/nightfox.nvim"
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use 'neovim/nvim-lspconfig'
  use { 'echasnovski/mini.nvim', branch = 'stable' }
  use 'nvim-treesitter/nvim-treesitter'
  use 'folke/tokyonight.nvim'
  -- use 'Shatur/neovim-ayu'
  -- use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'ggandor/lightspeed.nvim'
  use 'folke/which-key.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
  'ojroques/nvim-lspfuzzy',
  requires = {
    {'junegunn/fzf'},
    {'junegunn/fzf.vim'},  -- to enable preview (optional)
  },
}
end)
