-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require "nvim-tree".setup {
	sort_by = "case_sensitive",
	view = {
		number = true,
		relativenumber = true,
		adaptive_size = true,
		signcolumn = 'yes',
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
			},
		},
	},
	renderer = {
		group_empty = true,
		icons = {
			glyphs = {
				git = {
					unstaged = "פֿ",
				},
			},
		}
	},
	filters = {
		dotfiles = true,
	},
}

vim.keymap.set('n', '<C-b>', ":NvimTreeToggle<CR>")
