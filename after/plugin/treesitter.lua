local is_treesitter_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not is_treesitter_ok then
  print("Please, ensure install of `nvim-treesitter/nvim-treesitter` plugin")
  return
end

treesitter.setup({
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        sync_install = false,
        auto_install = true,
        ensure_installed = {
          "bash",
          "css",
          "dockerfile",
          "gitignore",
          "glimmer",
          "go",
          "hcl",
          "helm",
          "html",
          "http",
          "json",
          "lua",
          "luadoc",
          "markdown",
          "pem",
          "prisma",
          "python",
          "scss",
          "javascript",
          "sql",
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
      })
    end,
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
