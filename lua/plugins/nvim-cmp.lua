return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-cmdline",
    "onsails/lspkind-nvim",

    -- Snippets
    -----------------------------------------------------------------------------
    "rafamadriz/friendly-snippets", -- snippets repository
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
  },
}
