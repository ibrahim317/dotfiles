return {
	{
        "ibrahim317/dired.nvim",
        branch = "staging",
		dependencies = { "MunifTanjim/nui.nvim" },
		config = function()
			require("dired").setup({
				path_separator = "/",
				show_banner = false,
				show_icons = false,
				show_hidden = true,
				show_dot_dirs = true,
				show_colors = true,
				sort_order = "dirs",
			})
		end,
		-- Optional: Add lazy-loading (e.g., triggered by a command)
		cmd = { "Dired" }, -- Assumes dired.nvim uses a :Dired command
	},
}
