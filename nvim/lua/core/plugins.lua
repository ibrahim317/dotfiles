return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use({ "nvim-telescope/telescope.nvim", tag = "0.1.6", requires = { { "nvim-lua/plenary.nvim" } } })

	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional
		},
	})
	use({ -- autoclose and autorename tags
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-treesitter.configs").setup({
				autotag = {
					enable = true,
				},
			})
		end,
	})

	-- nvim-cmp and dependencies
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions (: and :!)
	use("L3MON4D3/LuaSnip") -- snippets engine
	use("saadparwaiz1/cmp_luasnip") -- connector between snippets engine and cmp
	use("rafamadriz/friendly-snippets")

	-- lsp
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"neovim/nvim-lspconfig",
	})

	-- formatter
	use("mhartington/formatter.nvim")

	use("morhetz/gruvbox")
	use("widatama/vim-phoenix")
	use("xiyaowong/transparent.nvim")
end)
