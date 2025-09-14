return {
	{
		dir = "/home/ibrahim/Desktop/community-dev/cursor-agent.nvim-main",
		config = function()
			require("cursor-agent").setup({
				-- Enable split windows instead of floating windows
				split = true,
				-- Width of split windows (0-1 for percentage, or absolute number)
				split_width = 0.4,
			})
		end,
	},
}
