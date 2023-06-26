------------------------------------------------------------------
-- Autocomplete configurations
------------------------------------------------------------------

local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
    return
end

local lspkind_status_ok, lspkind = pcall(require, 'lspkind')
if not lspkind_status_ok then 
    return
end

lspkind.init({})

cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        require('luasnip').lsp_expand(args.body)
--        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },
  -- Installed sources:
  sources = {
    { name = 'path' },                              -- file paths
    { name = 'calc'},                               -- source for math calculation
    { name = 'buffer', keyword_length = 2, priority = 5 },        -- source current buffer
    { name = 'nvim_lua', keyword_length = 2, priority = 7 },       -- complete neovim's Lua runtime API such vim.lsp.*
    { name = 'luasnip', keyword_length = 1, priority = 7 },
    { name = 'nvim_lsp_signature_help', priority = 8 },            -- display function signatures with current parameter emphasized
    { name = 'nvim_lsp', keyword_length = 3, priority = 10 },      -- from language server
    { name = 'crates', keyword_length = 1, priority = 10 },
    -- { name = 'vsnip', keyword_length = 2 },         -- nvim-cmp source for vim-vsnip 

  },
  window = {
      completion = { 
          cmp.config.window.bordered(), 
          col_offset = 3, 
          size_padding = 1,
      },
      documentation = cmp.config.window.bordered(),
  },
  formatting = {
      fields = {'menu', 'abbr', 'kind'},
      format = lspkind.cmp_format({
          mode = 'symbol_text',
          maxwidth = 60,
          before = function(entry, item)
            
              local menu_icon ={
                nvim_lsp = 'λ',
                vsnip = '⋗',
                buffer = 'Ω',
                path = '🖫',
            }
            item.menu = menu_icon[entry.source.name]
            return item
          end,
      })
  },
  preselect = cmp.PreselectMode.None,
  confirmation = {
      get_commit_charactes = function(commit_characters)
          return {}
      end
  },
})
