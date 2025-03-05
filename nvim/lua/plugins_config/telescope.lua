local telescope = require("telescope")
telescope.setup({
	defaults = {
		winblend = 30,
		file_ignore_patterns = { "node_modules" },
	},
})
require("noice").setup({
	cmdline = {
		enabled = true, -- Enable command-line UI
		view = "cmdline_popup", -- Use a popup for the command line
	},
})
