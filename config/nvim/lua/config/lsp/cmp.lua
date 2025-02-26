local cmp = require'cmp'

vim.api.nvim_set_hl(0, 'CmpItemKind', { bg = 'NONE', fg = '#ffffff' })
vim.api.nvim_set_hl(0, 'CmpItemAbbr', { bg = 'NONE', fg = '#ffffff' })
vim.api.nvim_set_hl(0, 'CmpItemMenu', { bg = 'NONE', fg = '#aaaaaa' })

cmp.setup({
  formatting = {
    -- fields = {'abbr','menu','kind'},
    fields = {'kind','abbr','menu'},
    -- fields = {'abbr','kind'},
    expandable_indicator = true,
    format = function(entry, vim_item)
      -- Define icons for different item kinds
      local icons = {
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "",
        Variable = "",
        Class = "ﴯ",
        Interface = "",
        Module = "",
        Property = "ﰠ",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "פּ",
        Event = "",
        Operator = "",
        TypeParameter = "",
      }

      -- Customize the item kind with an icon
      vim_item.kind = string.format('%s', icons[vim_item.kind] or '')
      vim_item.kind_hl_group = 'NONE'
      -- vim_item.kind = string.format('%s %s', icons[vim_item.kind] or '', vim_item.kind)

      -- Show source of completion
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        luasnip = "[Snippet]",
        buffer = "[Buffer]",
        path = "[Path]",
      })[entry.source.name] or ""

      return vim_item
    end,

  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>']     = cmp.mapping.scroll_docs(-4),
    ['<C-f>']     = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>']     = cmp.mapping.abort(),
    ['<CR>']      = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' } },{
    { name = 'buffer' }}),
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
