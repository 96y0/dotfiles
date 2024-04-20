require("config.harpoon")
require("config.telescope")
require("config.treesitter")
require("config.undotree")
require("config.fugitive")
require("config.mason")
require("config.lsp")
require("config.cmp")
require("config.lualine")
require("config.dap")
require("config.cmake")
require("config.gitsigns")

require("nvim-autopairs").setup()
require("symbols-outline").setup()
require("gruvbox").setup({
    inverse = true,
    contrast = "hard",
    dim_inactive = false,
}) 
vim.cmd[[colorscheme gruvbox]]
