return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use({ "nvim-telescope/telescope.nvim", tag = "0.1.6", requires = { { "nvim-lua/plenary.nvim" } } })

	use("mhartington/formatter.nvim")

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

	use("kassio/neoterm")
	use("morhetz/gruvbox")
	use("xiyaowong/transparent.nvim")
end)
