return {
	{
		"junegunn/fzf.vim",
		dependencies = { "junegunn/fzf" },
		init = function()
			-- fd as the searcher
			vim.env.FZF_DEFAULT_COMMAND = table.concat({
				"fd",
				"--type f",
				"--hidden",
				"--follow",
				"--exclude .git",
				"--exclude node_modules",
				"--exclude dist",
				"--exclude build",
				"--exclude .next",
				"--exclude coverage",
				"--exclude venv",
			}, " ")

			-- bottom split
			vim.g.fzf_layout = { down = "40%" }

			-- :Find = :Files
			vim.api.nvim_create_user_command("Find", function(opts)
				vim.cmd("Files " .. (opts.args or ""))
			end, { nargs = "?" })
		end,
	},
}
