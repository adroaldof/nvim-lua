local mason_status, mason = pcall(require, "mason")
if not mason_status then
  print("Please, ensure install of `williamboman/mason.nvim` plugin")
  return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  print("Please, ensure install of `williamboman/mason-lspconfig.nvim` plugin")
  return
end

mason.setup({
  ui = {
    border = "rounded",
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

mason_lspconfig.setup({
  ensure_installed = {
    "bashls",
    "cssls",
    "eslint",
    "html",
    "jsonls",
    "lua_ls",
    "pylsp",
    "pyright",
    "remark_ls",
    "terraformls",
    "tflint",
    "tsserver",
    "yamlls",
  },
  automatic_installation = false,
})
