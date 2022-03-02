local packer = require("plugins.packerInit")
local use = packer.use

return packer.startup(function()
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = 'require "plugins.configs.telescope"',
	}) -- fuzy finder
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", config = 'require "plugins.configs.treesitter"' }) --syntax highlightin
	use({ "windwp/nvim-autopairs", config = 'require "plugins.configs.autopairs"' }) --autopairs
	use({ "numToStr/Comment.nvim", config = 'require "plugins.configs.comment"' }) --faster commenting
	use({ "kyazdani42/nvim-tree.lua", config = 'require "plugins.configs.nvim-tree"' }) --file explorer
	use({ "lukas-reineke/indent-blankline.nvim", config = 'require"plugins.configs.indent-blankline"' }) -- pretty indents
	use("kyazdani42/nvim-web-devicons")
	use({
		"akinsho/bufferline.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = 'require "plugins.configs.bufferline"',
	})
	use({ "akinsho/toggleterm.nvim", config = 'require "plugins.configs.toggleterm"' })
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = 'require "plugins.configs.lualine"',
	})
	use({ "karb94/neoscroll.nvim", config = 'require "plugins.configs.neoscroll"' })
	use({ "norcalli/nvim-colorizer.lua", config = 'require "plugins.configs.colorizer"' })
	--Themes
	use("shaunsingh/nord.nvim")
	use("andersevenrud/nordic.nvim")
	--CMP Plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use
	--LSP Plugins
	use({ "neovim/nvim-lspconfig" }) -- enable LSP
	use({ "williamboman/nvim-lsp-installer" })
	use({ "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" })
	use({ "ray-x/lsp_signature.nvim" })

	--null-ls
	use({ "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" } })
	--git
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = 'require "plugins.configs.gitsigns"',
	})
end)
