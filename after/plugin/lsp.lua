local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
    print("Please, ensure install of `neovim/nvim-lspconfig` plugin")
    return
end

local protocol = require("vim.lsp.protocol")

protocol.CompletionItemKind = {
    "", -- Text
    "", -- Method
    "", -- Function
    "", -- Constructor
    "", -- Field
    "", -- Variable
    "", -- Class
    "ﰮ", -- Interface
    "", -- Module
    "", -- Property
    "", -- Unit
    "", -- Value
    "", -- Enum
    "", -- Keyword
    "﬌", -- Snippet
    "", -- Color
    "", -- File
    "", -- Reference
    "", -- Folder
    "", -- EnumMember
    "", -- Constant
    "", -- Struct
    "", -- Event
    "ﬦ", -- Operator
    "", -- TypeParameter
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    update_in_insert = false,
    virtual_text = { spacing = 4, prefix = "●" },
    severity_sort = true,
})

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = "", Warn = "", Hint = "ﴞ", Info = "" }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
    virtual_text = {
        prefix = "●",
    },
    update_in_insert = true,
    float = {
        source = "always", -- Or "if_many"
    },
})

-- Setup
--------------------------------------------------------------------------------
local on_attach = function(_, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "<space>k", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, bufopts)
    -- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set("n", "gl", function()
        vim.diagnostic.open_float({ border = "rounded" })
    end, bufopts)
    vim.keymap.set("n", "<space>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "<space>f", function()
        vim.lsp.buf.format({ async = true })
    end, bufopts)

    vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format{async=true}' ]])
end

-- Language Specific LSP
--------------------------------------------------------------------------------
-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- JS and TS
--------------------------------------------------------------------------------
lspconfig.tsserver.setup({
    on_attach = on_attach,
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    cmd = { "typescript-language-server", "--stdio" },
    capabilities = capabilities,
})

-- Lua
--------------------------------------------------------------------------------
lspconfig.sumneko_lua.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true), -- Make the server aware of Neovim runtime files
                checkThirdParty = false,
            },
            runtime = {
                version = "LuaJIT",
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

-- CSS
--------------------------------------------------------------------------------
lspconfig.cssls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

-- Terraform
--------------------------------------------------------------------------------
lspconfig.terraformls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

-- JSON
--------------------------------------------------------------------------------
lspconfig.jsonls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
