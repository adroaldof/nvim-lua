local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    print("Please, ensure install of `jose-elias-alvarez/null-ls.nvim` plugin")
    return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion

null_ls.setup({
    debug = false,
    sources = {
        -- TS
        formatting.prettier,
        diagnostics.eslint,
        -- Python
        formatting.black.with({ extra_args = { "--fast" } }),
        diagnostics.flake8,
        -- Lua
        formatting.stylua,
        -- spell
        completion.luasnip,
        completion.spell,
        -- Terraform
        formatting.terrafmt,
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
})
