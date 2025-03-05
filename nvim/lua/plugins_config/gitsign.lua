require("gitsigns").setup({
	signs = {
		add = { text = "+" }, -- Added lines
		change = { text = "~" }, -- Modified lines
		delete = { text = "_" }, -- Deleted lines
		topdelete = { text = "‾" }, -- Deleted lines above
		changedelete = { text = "~" }, -- Changed and deleted lines
		untracked = { text = "┆" }, -- Untracked files
	},
	signcolumn = true, -- Show signs in the sign column
	numhl = false, -- Don't highlight line numbers
	linehl = false, -- Don't highlight the entire line
	word_diff = false, -- Don't highlight word differences
	watch_gitdir = {
		interval = 1000, -- Check for Git changes every second
		follow_files = true,
	},
	attach_to_untracked = true, -- Show signs for untracked files
	current_line_blame = false, -- Disable inline blame text
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- Inline blame text position
		delay = 1000, -- Delay before showing blame
		ignore_whitespace = false,
	},
	current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
	sign_priority = 6, -- Priority of signs in the sign column
	update_debounce = 100, -- Debounce time for updates
	status_formatter = nil, -- Use default status formatter
	max_file_length = 40000, -- Disable for large files
	preview_config = {
		border = "single", -- Border style for preview windows
		style = "minimal", -- Preview window style
		relative = "cursor", -- Position of preview window
		row = 0, -- Row offset
		col = 1, -- Column offset
	},
})
