-- Leader key
vim.g.mapleader = " "

-- Explorer and Save
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>ss", ":w<CR>")

-- Navigate betweeen quickfix items
vim.keymap.set("n", "<leader>h", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>;", "<cmd>cprev<CR>zz")

-- Jump with center cursor
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Move line
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Copy to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Buffer keybinding
vim.keymap.set("n", "<A-z>", ":bprevious<CR>", {})
vim.keymap.set("n", "<A-x>", ":bnext<CR>", {})
vim.keymap.set("n", "<A-w>", ":bw<CR>", {})
vim.keymap.set("n", "<A-q>", ":bd<CR>", {})

-- Projects
vim.keymap.set('n', '<leader>pp', ":Telescope projects<CR>", {})

-- Undotree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- Neogit
vim.keymap.set('n', '<leader>gg', ":Neogit<CR>", {})
