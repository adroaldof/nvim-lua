local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	print("Please, ensure install of `jose-elias-alvarez/null-ls.nvim` plugin")
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		-- TS
		formatting.prettier.with({ extra_args = { "--single-quote", "--jsx-single-quote" } }),
		diagnostics.eslint,
		-- Python
		formatting.black.with({ extra_args = { "--fast" } }),
		diagnostics.flake8,
		-- Lua
		formatting.stylua,
	},
})

vim.cmd([[
    augroup FormatAutogroup
        autocmd!
        autocmd! BufWritePre * lua vim.lsp.buf.formatting_sync()
    augroup END
]])
