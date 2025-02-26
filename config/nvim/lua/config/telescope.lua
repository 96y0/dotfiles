require('telescope').setup({
  defaults = {
    floating_window = true,
    floating_window_above = true,
    winblend = 0,
    layout_config = {
      vertical = { width = 0.5 }
    },
    pickers = {
      find_files = {
        theme = "dropdown",
      }
    },
  }
})


local builtin = require('telescope.builtin')
local utils = require('telescope.utils')

local function project_files()
  local opts = {}
  vim.fn.system('git rev-parse --is-inside-work-tree')
  if vim.v.shell_error == 0 then
    builtin.git_files(opts)
  else
    builtin.find_files(opts)
  end
end

vim.keymap.set('n', '<leader>fc', function() builtin.find_files({ cwd = utils.buffer_dir() }) end, {})
vim.keymap.set('n', '<leader>ff', function() project_files() end, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>?',  builtin.oldfiles, {})
-- vim.keymap.set('n', '<leader>ds', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
