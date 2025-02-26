-- vim.opt.syntax = true
vim.opt.number     = true
vim.termguicolors  = true
vim.opt.cursorline = true
vim.opt.updatetime = 100
-- vim.opt.t_Co = 256

vim.opt.expandtab  = true
vim.opt.ignorecase = false
vim.opt.laststatus = 2
vim.opt.shiftwidth = 2
vim.opt.tabstop    = 2

vim.opt.backup   = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir  = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.encoding   = "utf-8"
vim.opt.background = "dark"
vim.opt.guifont    = "JetBrainsMono Nerd Font:h12:#h-slight"
