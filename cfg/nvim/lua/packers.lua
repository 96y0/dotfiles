require('packer').startup(function()

  -- Packer
  use 'wbthomason/packer.nvim'

  -- Github theme
  use 'projekt0n/github-nvim-theme'

  -- Catppuccin theme
  use { "catppuccin/nvim", as = "catppuccin" }

  -- NvimTree
  use 'kyazdani42/nvim-tree.lua'

  -- Icon theme
  use 'kyazdani42/nvim-web-devicons'

  -- Circle icon
  -- use 'projekt0n/circles.nvim'

  -- Code syntax
  use 'nvim-treesitter/nvim-treesitter'

  -- Bar
  use 'romgrk/barbar.nvim'              

  -- Statusline
  -- use 'feline-nvim/feline.nvim' 
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Code navigator
  use({
    'ray-x/navigator.lua',              
    requires = {
        { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
        { 'neovim/nvim-lspconfig' },
    },
  })

  -- Telescope
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.0',
  -- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Terminal 
  -- use 'kassio/neoterm'
  use {
    's1n7ax/nvim-terminal',
    config = function()
        vim.o.hidden = true
        require('nvim-terminal').setup()
    end,
  }  

  -- Discord presence 
  use 'andweeb/presence.nvim'

  -- Code intellisence
  use {'neoclide/coc.nvim', branch = 'release'}
end)
