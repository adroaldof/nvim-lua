return {
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- AI and Git
  -----------------------------------------------------------------------------
  -- { "github/copilot.vim", lazy = false },
  "lewis6991/gitsigns.nvim",
  -- 'tpope/vim-fugitive', -- Git commands in nvim
  -- 'tpope/vim-rhubarb', -- Fugitive-companion to interact with github

  -- Status line and visuals
  -----------------------------------------------------------------------------
  { "nvim-lualine/lualine.nvim", dependencies = "nvim-tree/nvim-web-devicons" },
  { "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
  "nvim-tree/nvim-tree.lua",
  -- "stevearc/oil.nvim", -- More modern netrw

  -- Theme
  -----------------------------------------------------------------------------
  { "rebelot/kanagawa.nvim", event = "VeryLazy" },

  -- Editor helpers
  -----------------------------------------------------------------------------
  "windwp/nvim-autopairs", -- add matching pair
  "windwp/nvim-ts-autotag",
  "numToStr/Comment.nvim", -- toggle comments with gc
  "JoosepAlviste/nvim-ts-context-commentstring", -- comment context
  "onsails/lspkind.nvim",
  "lukas-reineke/indent-blankline.nvim", -- adds indentation guides to code blocks
  "gpanders/editorconfig.nvim", -- apply editor config file to the buffer
  "hiphish/rainbow-delimiters.nvim", -- color pairs

  -- Vim
  -----------------------------------------------------------------------------
  -- "nvim-treesitter/nvim-treesitter", -- Highlight, edit, and navigate code
  "nvim-treesitter/nvim-treesitter-textobjects", -- Additional textobjects for treesitter

  -- LSP
  -----------------------------------------------------------------------------
  "neovim/nvim-lspconfig", -- Collection of configurations for built-in LSP client
  "williamboman/mason.nvim", -- Automatically install LSPs to stdpath for neovim
  "williamboman/mason-lspconfig.nvim", -- ibid
  "folke/neodev.nvim", -- Lua language server configuration for nvim
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
  },
  { "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp" },

  -- Fuzzy Finder (files, lsp, etc)
  -----------------------------------------------------------------------------
  -- { "nvim-telescope/telescope.nvim", version = "*", dependencies = { "nvim-lua/plenary.nvim" } },
  -- { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- NOTE: If you have trouble with this installation, refer to the README for telescope-fzf-native.

  -- Formatters
  -----------------------------------------------------------------------------
  "stevearc/conform.nvim",

  -- Miscelanious
  -----------------------------------------------------------------------------
  "takac/vim-hardtime",

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    -- config = function()
    --   local configs = require("nvim-treesitter.configs")
    --
    --   configs.setup({
    --     sync_install = false,
    --     auto_install = true,
    --     ensure_installed = {
    --       "bash",
    --       "css",
    --       "dockerfile",
    --       "gitignore",
    --       "glimmer",
    --       "go",
    --       "hcl",
    --       "helm",
    --       "html",
    --       "http",
    --       "json",
    --       "lua",
    --       "luadoc",
    --       "markdown",
    --       "pem",
    --       "prisma",
    --       "python",
    --       "scss",
    --       "javascript",
    --       "sql",
    --       "terraform",
    --       "tsx",
    --       "typescript",
    --       "vim",
    --       "yaml",
    --     },
    --     indent = {
    --       enable = true,
    --     },
    --     highlight = {
    --       enable = true,
    --       additional_vim_regex_highlighting = false,
    --     },
    --     -- autotag = {
    --     --   enable = true,
    --     -- },
    --     rainbow = {
    --       enable = true,
    --       extended_mode = true,
    --       max_file_lines = nil,
    --     },
    --   })
    -- end,
  },
}
