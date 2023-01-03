local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
	print("Please, enstall ensure install of `hrsh7th/nvim-cmp` plugin")
	return
end

local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
	print("Please, enstall ensure install of `saadparwaiz1/cmp_luasnip` plugin")
	return
end

local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
	print("Please, enstall ensure install of `onsails/lspkind.nvim` plugin")
	return
end

require("luasnip/loaders/from_vscode").lazy_load()

local cmp_autopairs = require("nvim-autopairs.completion.cmp")

local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
		["<C-e>"] = cmp.mapping.abort(), -- close completion window
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
	}),
	-- sources for autocompletion
	sources = cmp.config.sources({
		{ name = "nvim_lsp" }, -- lsp
		{ name = "luasnip" }, -- snippets
		{ name = "buffer" }, -- text within current buffer
		{ name = "path" }, -- file system paths
	}),
	-- configure lspkind for vs-code like icons
	formatting = {
		format = lspkind.cmp_format({
			maxwidth = 50,
			ellipsis_char = "...",
		}),
	},
})
