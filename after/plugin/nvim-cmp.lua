local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
  print("Please, ensure install of `hrsh7th/nvim-cmp` plugin")
  return
end

local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
  print("Please, ensure install of `saadparwaiz1/cmp_luasnip` plugin")
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
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
    ["<C-e>"] = cmp.mapping.abort(), -- close completion window
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" }, -- lsp
    { name = "nvim_lsp_signature_help" },
    { name = "luasnip" }, -- snippets
    { name = "path" }, -- file system paths
  }, {
    { name = "buffer" }, -- text within current buffer
  }),
  formatting = {
    format = function(entry, vim_item)
      if vim.tbl_contains({ "path" }, entry.source.name) then
        local icon, hl_group = devicons.get_icon(entry:get_completion_item().label)
        if icon then
          vim_item.kind = icon
          vim_item.kind_hl_group = hl_group
          return vim_item
        end
      end
      return lspkind.cmp_format({ maxwidth = 50, ellipsis_char = "..." })(entry, vim_item)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
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

vim.cmd([[
    " gray
    highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
    " blue
    highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
    highlight! link CmpItemAbbrMatchFuzzy CmpItemAbbrMatch
    " light blue
    highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
    highlight! link CmpItemKindInterface CmpItemKindVariable
    highlight! link CmpItemKindText CmpItemKindVariable
    " pink
    highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
    highlight! link CmpItemKindMethod CmpItemKindFunction
    " front
    highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
    highlight! link CmpItemKindProperty CmpItemKindKeyword
    highlight! link CmpItemKindUnit CmpItemKindKeyword
]])
