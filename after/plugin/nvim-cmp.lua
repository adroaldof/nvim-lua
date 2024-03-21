local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
  print("Please, ensure install of `hrsh7th/nvim-cmp` plugin")
  return
end

local luasnip_status, luasnip = pcall(require, "snippy")
if not luasnip_status then
  print("Please, ensure install of `dcampos/nvim-snippy` plugin")
  return
end

local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
  print("Please, ensure install of `onsails/lspkind.nvim` plugin")
  return
end

local devicons_status, devicons = pcall(require, "nvim-web-devicons")
if not devicons_status then
  print("Please, ensure install of `nvim-tree/nvim-web-devicons` plugin")
  return
end

local cmp_select = { behavior = cmp.SelectBehavior.Select }

vim.opt.completeopt = { "menu", "menuone", "noselect" }

cmp.setup({
  snippet = {
    expand = function(args)
      require("snippy").expand_snippet(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
    ["<C-e>"] = cmp.mapping.abort(), -- close completion window
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    -- ["<Tab>"] = cmp.mapping.confirm({ select = true }),
  }),
  -- sources = cmp.config.sources({
  --   { name = "nvim_lsp" }, -- lsp
  --   { name = "snippy" }, -- snippets
  --   { name = "path" }, -- file system paths
  -- }, {
  --   { name = "buffer", keyword_length = 2 }, -- text within current buffer
  -- }),

  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol", -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      -- can also be a function to dynamically calculate max width such as
      -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
      ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
      show_labelDetails = true, -- show labelDetails in menu. Disabled by default

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function(entry, vim_item)
        -- local word = entry.get_insert_text()
        -- if entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet then
        --   word = vim.lsp.until.parse_snippet(word)
        -- end
        -- word = str.online(word)
        -- if entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet then
        --   word = word .. "~"
        -- end
        if vim.tbl_contains({ "path" }, entry.source.name) then
          local icon, hl_group = devicons.get_icon(entry:get_completion_item().label)
          if icon then
            vim_item.kind = icon
            vim_item.kind_hl_group = hl_group
            return vim_item
          end
        end
        return vim_item
      end,
    }),
  },

  enabled = function()
    local context = require("cmp.config.context")
    if vim.api.nvim_get_mode().mode == "c" then
      return true
    else
      return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
    end
  end,
})

-- local on_attach = function(client, bufnr)
--   local function buf_set_keymap(...)
--     vim.api.nvim_buf_set_keymap(bufnr, ...)
--   end
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
--
-- -- Add additional capabilities supported by nvim-cmp
-- local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()) --nvim-cmp
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
--
-- local lspconfig = require("lspconfig")
--
-- -- Enable some language servers with the additional completion capabilities offered by nvim-cmp
-- local servers = { "tsserver", "vimls", "lua_ls" }
-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup({
--     -- on_attach = my_custom_on_attach,
--     capabilities = capabilities,
--   })
-- end

-- vim.cmd([[
--     " gray
--     highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
--     " blue
--     highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
--     highlight! link CmpItemAbbrMatchFuzzy CmpItemAbbrMatch
--     " light blue
--     highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
--     highlight! link CmpItemKindInterface CmpItemKindVariable
--     highlight! link CmpItemKindText CmpItemKindVariable
--     " pink
--     highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
--     highlight! link CmpItemKindMethod CmpItemKindFunction
--     " front
--     highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
--     highlight! link CmpItemKindProperty CmpItemKindKeyword
--     highlight! link CmpItemKindUnit CmpItemKindKeyword
-- ]])
