require('barbar')
require('option')
require('keymap')
require('plugins')
require('lspserver')
require('nvim-autopairs').setup()
require('nvim-tree').setup()
require('lualine').setup()
require('nvim_comment').setup()
require('todo-comments').setup()
require'nvim-treesitter.configs'.setup{highlight={enable=true}} 
require("toggleterm").setup{
  open_mapping = [[<c-\>]]  
}

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

require("catppuccin").setup {
    color_overrides = {
        mocha = {
          base = "#11111B",
        },
    }
}

vim.cmd.colorscheme "catppuccin-mocha"


