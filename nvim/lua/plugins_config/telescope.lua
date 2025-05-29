local telescope = require("telescope")
telescope.setup({
	defaults = {
		winblend = 30,
		file_ignore_patterns = { "node_modules" },
    find_command = {
      "rg",
      "--files",
      "--hidden",
      "--glob",
      "!**/.git/*",
	  "--ignore",
	  "!.env"
    },
	},
})
