local lspconfig = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()

local builtin = require('telescope.builtin')

capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.documentSymbol.labelSupport = true

vim.fn.sign_define('DiagnosticSignError', {text = '', texthl = 'DiagnosticSignError'})
vim.fn.sign_define('DiagnosticSignWarn', {text = '', texthl = 'DiagnosticSignWarn'})
vim.fn.sign_define('DiagnosticSignHint', {text = '', texthl = 'DiagnosticSignHint'})
vim.fn.sign_define('DiagnosticSignInfo', {text = '', texthl = 'DiagnosticSignInfo'})

local on_attach = function(client, bufnr)
  local opts = {  noremap = true, silent = true }

  vim.keymap.set("n", "gd",          function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K",           function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd",  function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set('n', '<leader>ds',  builtin.lsp_document_symbols, { buffer = bufnr })
  vim.keymap.set("n", "[d",          function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d",          function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>",       function() vim.lsp.buf.signature_help() end, opts)
end

lspconfig.lua_ls.setup{ on_attach = on_attach, capabilities = capabilities, }
lspconfig.csharp_ls.setup{ on_attach = on_attach, capabilities = capabilities, }
lspconfig.pyright.setup{ on_attach = on_attach, capabilities = capabilities, }
lspconfig.cmake.setup{ on_attach = on_attach, capabilities = capabilities, }
lspconfig.clangd.setup{ on_attach = on_attach, capabilities = capabilities, }

