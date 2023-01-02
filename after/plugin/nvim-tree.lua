-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		number = true,
		relativenumber = true,
		adaptive_size = true,
		signcolumn = "yes",
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
			},
		},
	},
	renderer = {
		highlight_opened_files = "all",
		group_empty = true,
		icons = {
			glyphs = {
				git = {
					unstaged = "פֿ",
				},
			},
		},
	},
	filters = {
		dotfiles = false,
	},
	git = {
		ignore = false,
		enable = true,
	},
})

vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>")
