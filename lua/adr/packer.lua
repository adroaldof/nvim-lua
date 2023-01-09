local packer_status, packer = pcall(require, "packer")
if not packer_status then
	print("Please, ensure install of `wbthomason/packer.nvim` plugin manager is installed")
	return
end

local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.cmd([[packadd packer.nvim]])
end

-- vim.cmd([[
--     augroup packer_config
--         autocmd!
--         autocmd BufWritePost packer.lua source <afile> | PackerInstall
--     augroup end
-- ]])

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	-- Common optional plugins
	-----------------------------------------------------------------------------
	use("nvim-lua/plenary.nvim") -- useful Lua functions
	use("nvim-tree/nvim-web-devicons") -- icons

	-- Navigator and finder
	-----------------------------------------------------------------------------
	use({ "nvim-telescope/telescope.nvim", tag = "0.1.0" }) -- fuzzy finder
	use("nvim-tree/nvim-tree.lua") -- file navigation

	-- Theme, Status line and visuals
	-----------------------------------------------------------------------------
	use({ "lunarvim/darkplus.nvim", as = "darkplus" }) -- theme
	use("nvim-lua/popup.nvim") -- implementation of pupup API
	use("nvim-lualine/lualine.nvim") -- status line
	use({ "akinsho/bufferline.nvim", tag = "v3.*" })

	-- Treesitter
	-----------------------------------------------------------------------------
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	-- Accesories
	use("onsails/lspkind.nvim") -- vscode like pictograms
	use("windwp/nvim-ts-autotag") -- use treesitter autoclose and autorename
	use("p00f/nvim-ts-rainbow") -- colour match characters

	-- LSP, autocompletion and snippets
	-----------------------------------------------------------------------------
	-- LP Support
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	-- Autocompletion
	use("hrsh7th/nvim-cmp") -- enable completions
	use("hrsh7th/cmp-buffer") -- source for buffer words
	use("hrsh7th/cmp-path") -- source for path words
	use("saadparwaiz1/cmp_luasnip") -- source luasnip words
	use("hrsh7th/cmp-nvim-lsp") -- source neovim built-in LSP
	use("hrsh7th/cmp-nvim-lua") -- source neovim Lua runtime API
	-- Snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("rafamadriz/friendly-snippets") -- snippets repository

	-- Git
	-----------------------------------------------------------------------------
	use("lewis6991/gitsigns.nvim")

	-- Editor helpers
	-----------------------------------------------------------------------------
	use("jose-elias-alvarez/null-ls.nvim") -- format and lint
	use("editorconfig/editorconfig-vim") -- apply editor config file to the buffer
	use("lukas-reineke/indent-blankline.nvim") -- adds indentation guides to code blocks
	use("windwp/nvim-autopairs") -- add matching pair
	use("numToStr/Comment.nvim") -- toggle comments with gc
	use("JoosepAlviste/nvim-ts-context-commentstring") -- comment context

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
