require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"go",
		"hcl",
		"help",
		"html",
		"javascript",
		"lua",
		"python",
		"tsx",
		"typescript",
		"vim",
		"yaml",
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	autotag = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
})

-- Closing a tag causes built-in LSP to update diagnostics incorrectly
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	virtual_text = {
		spacing = 5,
		severity_limit = "Warning",
	},
	update_in_insert = true,
})
