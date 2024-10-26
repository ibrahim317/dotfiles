require("nvim-treesitter").setup({
	ensure_installed = {"lua", "javascript", "typescript", "help", "php" },

	sync_install = true,

	auto_install = true,

	highlight = {
		enable = false, -- Disable highlighting
	},
	autotag = {
		enable = true,
	},
	-- You can disable other features similarly
})
