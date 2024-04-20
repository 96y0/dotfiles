-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
    use 'ellisonleao/gruvbox.nvim'
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'} 
	use 'ThePrimeagen/harpoon'
	use 'mbbill/undotree'
	use 'tpope/vim-fugitive'
	use 'tpope/vim-commentary'
	use 'tpope/vim-surround'
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	use 'neovim/nvim-lspconfig'
	use 'L3MON4D3/LuaSnip'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-cmdline'
    use 'windwp/nvim-autopairs'
    use 'simrat39/symbols-outline.nvim'
    use 'nvim-lualine/lualine.nvim'
    use 'Civitasv/cmake-tools.nvim'
    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'
    use 'nvim-neotest/nvim-nio'
    use 'lewis6991/gitsigns.nvim'
    use 'RRethy/vim-illuminate'
end)
