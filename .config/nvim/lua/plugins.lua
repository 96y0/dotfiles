return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-lualine/lualine.nvim'
  use "windwp/nvim-autopairs"
  use 'morhetz/gruvbox'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'
  use 'Shirk/vim-gas'
  use 'sindrets/diffview.nvim'
  use 'RRethy/vim-illuminate'
  use 'simrat39/symbols-outline.nvim'
  use 'easymotion/vim-easymotion'
  -- use 'mfussenegger/nvim-dap'
  use 'preservim/vimux'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    requires = { {'nvim-lua/plenary.nvim'}}
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Mason&LSP
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  -- Autocompletion

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      -- Snippet Engine
      {'L3MON4D3/LuaSnip'},
      {'saadparwaiz1/cmp_luasnip'},

      -- LSP completion capabilities
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-cmdline'},
     }
  }
end)
