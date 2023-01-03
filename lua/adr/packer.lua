local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.cmd([[packadd packer.nvim]])
end

if is_bootstrap then
	print("================================================================================")
	print("= Please wait!")
	print("= Plugins are being prepared to be installed")
	print("================================================================================")
	return
end

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- Navigator and finder
	-----------------------------------------------------------------------------
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({
		"nvim-tree/nvim-tree.lua",
		requires = { { "nvim-tree/nvim-web-devicons" } },
	})

	-- Theme and Status line
	-----------------------------------------------------------------------------
	use({ "navarasu/onedark.nvim", as = "onedark" })
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- LSP, autocompletion and snippets
	-----------------------------------------------------------------------------
	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	-- Git
	-----------------------------------------------------------------------------
	use({
		"tanvirtin/vgit.nvim",
		config = function()
			require("vgit").setup({})
		end,
	})

	-- Editor helpers
	-----------------------------------------------------------------------------
	use("lukas-reineke/indent-blankline.nvim")
	use("editorconfig/editorconfig-vim")
	use("windwp/nvim-ts-autotag")
	use("Townk/vim-autoclose")
	use("p00f/nvim-ts-rainbow")
	use("windwp/nvim-autopairs")
	use("mhartington/formatter.nvim")
	use("onsails/lspkind.nvim")
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	-- Miscelanious
	-----------------------------------------------------------------------------
	use("takac/vim-hardtime")

	-- Language specific plugins
	-----------------------------------------------------------------------------
	use("hashivim/vim-terraform")

	if is_bootstrap then
		require("packer").sync()
	end
end)
