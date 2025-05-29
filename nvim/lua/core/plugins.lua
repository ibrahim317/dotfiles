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
	use("lukas-reineke/indent-blankline.nvim")
	use("folke/lazydev.nvim")
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
		"neovim/nvim-lspconfig",
	})

	-- formatter
	use({
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup()
		end,
	})
	use({
		"folke/noice.nvim",
		requires = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	})
	-- terminal
	use("akinsho/toggleterm.nvim")
	-- codeium
	use({
		"Exafunction/codeium.vim",
		config = function()
			-- Change '<C-g>' here to any keycode you like.
			vim.keymap.set("i", "<C-l>", function()
				return vim.fn["codeium#Accept"]()
			end, { expr = true, silent = true })
			vim.keymap.set("i", "<C-k>", function()
				return vim.fn["codeium#CycleCompletions"](1)
			end, { expr = true, silent = true })
			vim.keymap.set("i", "<C-j>", function()
				return vim.fn["codeium#CycleCompletions"](-1)
			end, { expr = true, silent = true })
			vim.keymap.set("i", "<C-h>", function()
				return vim.fn["codeium#Clear"]()
			end, { expr = true, silent = true })
		end,
	})
	-- git
	use("lewis6991/gitsigns.nvim")

	-- tabline
	use({ "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" })
	use({
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	})
	use("morhetz/gruvbox")
	-- solarized colorscheme
	use("maxmx03/solarized.nvim")
	use("widatama/vim-phoenix")
	use("xiyaowong/transparent.nvim")
	use('joshuavial/aider.nvim')
end)
