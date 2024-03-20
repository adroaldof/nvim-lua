return {
  -- Common optional plugins
  -----------------------------------------------------------------------------
  "nvim-lua/plenary.nvim",
  { "nvim-tree/nvim-web-devicons", lazy = true },
  "folke/which-key.nvim",
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  "folke/neodev.nvim",

  -- AI and Git
  -----------------------------------------------------------------------------
  { "github/copilot.vim", lazy = false },
  "lewis6991/gitsigns.nvim",

  -- Theme, Status line and visuals
  -----------------------------------------------------------------------------
  { "nvim-lualine/lualine.nvim", dependencies = "nvim-tree/nvim-web-devicons" },
  { "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },

  -- Editor helpers
  -----------------------------------------------------------------------------
  "windwp/nvim-autopairs", -- add matching pair
  "hiphish/rainbow-delimiters.nvim", -- color pairs
  "JoosepAlviste/nvim-ts-context-commentstring", -- comment context
  "windwp/nvim-ts-autotag",
  "onsails/lspkind.nvim",

  "lukas-reineke/indent-blankline.nvim", -- adds indentation guides to code blocks
  "HiPhish/rainbow-delimiters.nvim",

  "numToStr/Comment.nvim", -- toggle comments with gc
  "gpanders/editorconfig.nvim", -- apply editor config file to the buffer

  -- Window navigation
  -----------------------------------------------------------------------------
  "christoomey/vim-tmux-navigator", -- enable navigation within tmux

  -- LP Support
  -----------------------------------------------------------------------------
  "neovim/nvim-lspconfig",
  "williamboman/mason-lspconfig.nvim",
  "williamboman/mason.nvim",
  "jose-elias-alvarez/null-ls.nvim", -- format and lint
  "mhartington/formatter.nvim",

  -- Theme
  -----------------------------------------------------------------------------
  { "rebelot/kanagawa.nvim", event = "VeryLazy" },

  -- Miscelanious
  -----------------------------------------------------------------------------
  "takac/vim-hardtime",

  -- Language specific plugins
  -----------------------------------------------------------------------------
  "hashivim/vim-terraform",
}
