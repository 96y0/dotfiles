require('option')
require('keymap')
require('plugins')
require('lspserver')
require('nvim-autopairs').setup()
require("symbols-outline").setup()
require('mason').setup()
require("mason-lspconfig").setup {
  ensure_installed = { "lua_ls", "clangd", "bashls", "cmake", "pylsp" },
}

require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'gruvbox',
    component_seperators = '|',
    section_separators = ' ',
  },
}

require'nvim-treesitter.configs'.setup{
  ensure_installed = {'c','cpp','python','bash','lua','vim','vimdoc'},
  highlight= {
    enable=true
  }
}

require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    }
  }
}

require('telescope').load_extension('fzf')
vim.cmd[[let g:rainbow_active = 1 ]]
vim.cmd[[colorscheme gruvbox]]
