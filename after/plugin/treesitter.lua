local is_treesitter_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not is_treesitter_ok then
  print("Please, ensure install of `nvim-treesitter/nvim-treesitter` plugin")
  return
end

treesitter.setup({
  sync_install = false,
  auto_install = true,
  ensure_installed = {
    "bash",
    "css",
    "dockerfile",
    "gitignore",
    "go",
    "hcl",
    "helm",
    "html",
    "http",
    "javascript",
    "json",
    "lua",
    "luadoc",
    "markdown",
    "pem",
    "prisma",
    "python",
    "scss",
    "sql",
    "terraform",
    "terraform",
    "tsx",
    "typescript",
    "vim",
    "yaml",
  },
  indent = {
    enable = true,
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
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
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
