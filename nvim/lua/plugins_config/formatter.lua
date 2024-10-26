require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		cpp = { "clang-format" },
		rust = { "rustfmt" },
		php = { "php" },
		python = { "black" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
	},
	notify_on_error = true,
	formatters = {
		php = {
			command = "php-cs-fixer",
			args = {
				"fix",
				"$FILENAME",
			},
			stdin = false,
		},
	},
	format_on_save = {

		timeout_ms = 500,
		lsp_fallback = true,
	},
})
