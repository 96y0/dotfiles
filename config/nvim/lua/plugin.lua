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
  'goolord/alpha-nvim',
  'tpope/vim-commentary',
  'neovim/nvim-lspconfig',
  'RRethy/vim-illuminate',
  'nvim-lualine/lualine.nvim',
  'nvim-treesitter/nvim-treesitter',
  "nyoom-engineering/oxocarbon.nvim",
  'nvim-tree/nvim-web-devicons',
  'windwp/nvim-autopairs',
  "ahmedkhalf/project.nvim",

  { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
  { 'nvim-telescope/telescope.nvim', tag = '0.1.6', dependencies = { 'nvim-lua/plenary.nvim' } },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  { 'williamboman/mason.nvim', dependencies = { 'williamboman/mason-lspconfig.nvim' } },
  { 'L3MON4D3/LuaSnip', dependencies = { "rafamadriz/friendly-snippets" } },
  { "kylechui/nvim-surround", version = "*", event = "VeryLazy" },
  { 'hrsh7th/nvim-cmp', dependencies = { 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-cmdline' } },
  { 'nvim-orgmode/orgmode', event = 'VeryLazy', ft = { 'org' } },

  -- Git interface
  { "NeogitOrg/neogit", dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration
      "nvim-telescope/telescope.nvim", -- optional
    },
    config = true
  },

  {
    {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "luvit-meta/library", words = { "vim%.uv" } },
        },
      },
    },
    { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
    { -- optional completion source for require statements and module annotations
      "hrsh7th/nvim-cmp",
      opts = function(_, opts)
        opts.sources = opts.sources or {}
        table.insert(opts.sources, {
          name = "lazydev",
          group_index = 0, -- set group index to 0 to skip loading LuaLS completions
        })
      end,
    },
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    -- config = function()
    --  vim.cmd("colorscheme rose-pine")
    -- end
  },

  "HiPhish/rainbow-delimiters.nvim",

  { "catppuccin/nvim", name = "catppuccin", priority = 1000 }
}

local opts = {}
require("lazy").setup(plugins, opts)
