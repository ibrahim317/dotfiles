local util = require("formatter.util")

local prettier_filetypes = {
	"javascriptreact",
	"typescriptreact",
	"javascript",
	"typescript",
	"css",
	"scss",
	"html",
	"json",
	"yaml",
	"markdown",
}

local function use_prettier()
	local filetype = vim.bo.filetype
	for _, ft in ipairs(prettier_filetypes) do
		if ft == filetype then
			return true
		end
	end
	return false
end

require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		-- Formatter configurations for filetype "lua" go here
		-- and will be executed in order
		lua = {
			require("formatter.filetypes.lua").stylua,
			function()
				if util.get_current_buffer_file_name() == "special.lua" then
					return nil
				end
				return {
					exe = "stylua",
					args = {
						"--search-parent-directories",
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--",
						"-",
					},
					stdin = true,
				}
			end,
		},
		cpp = {
			function()
				return {
					exe = "clang-format",
					args = { "--assume-filename", vim.api.nvim_buf_get_name(0) },
					stdin = true,
				}
			end,
		},
		rust = {
			function()
				return {
					exe = "rustfmt",
					args = { "--emit=stdout" },
					stdin = true,
				}
			end,
		},
		python = {
			function()
				return {
					exe = "black", -- assuming you have black installed
					args = { "-" },
					stdin = true,
				}
			end,
		},
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
			function()
				if use_prettier() then
					return {
						exe = "prettier",
						args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
						stdin = true,
					}
				end
			end,
		},
	},
})

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})
