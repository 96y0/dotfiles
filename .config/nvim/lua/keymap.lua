local map = vim.api.nvim_set_keymap

-- Custom keybinds
map('n', '<c-s>', ':w<CR>',{})
-- map('n', '<c-a>', ':!gcc % && ./a.out<CR>', {})

-- Move up/down line
map('n', '<A-j>', ':m .+1<cr>==', {})
map('n', '<A-k>', ':m .-2<cr>==', {})
map('i', '<A-j>', ':m .+1<cr>==gi', {})
map('i', '<A-k>', ':m .-2<cr>==gi', {})
map('v', '<A-j>', ':m .+1<cr>gv=gv', {})
map('v', '<A-k>', ':m .-2<cr>gv=gv', {})

-- SymbolsOutline
map('n', '<F2>', ':SymbolsOutline<CR>', {})

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>?', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>fv', builtin.builtin, {})
