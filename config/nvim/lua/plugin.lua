local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	'mbbill/undotree',
	'tpope/vim-fugitive',
	'tpope/vim-commentary',
	'tpope/vim-surround',
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	'neovim/nvim-lspconfig',
	'L3MON4D3/LuaSnip',
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-cmdline',
	'windwp/nvim-autopairs',
	'simrat39/symbols-outline.nvim',
	'nvim-lualine/lualine.nvim',
	'mfussenegger/nvim-dap',
	'rcarriga/nvim-dap-ui',
	'nvim-neotest/nvim-nio',
	'lewis6991/gitsigns.nvim',
	'RRethy/vim-illuminate',
    'nvim-treesitter/nvim-treesitter',
    "ellisonleao/gruvbox.nvim",

	{ 'nvim-telescope/telescope.nvim', tag = '0.1.6', dependencies = { 'nvim-lua/plenary.nvim' } }
}

local opts = {}

require("lazy").setup(plugins, opts)
