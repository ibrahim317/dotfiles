require("mason").setup()
require("mason-lspconfig").setup()

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end
end

-- After setting up mason-lspconfig you may set up servers via lspconfig
require("lspconfig").lua_ls.setup({

	capabilities = capabilities,
})
require("lspconfig").pyright.setup({
	capabilities = capabilities,
	flags = {
		debounce_text_changes = 150,
	},
})

require("lspconfig").rust_analyzer.setup({
	capabilities = capabilities,
})
require("lspconfig").tailwindcss.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		tailwindCSS = {
			experimental = {
				classRegex = {
					{ "class\\s*?=\\s*?[\"'`]([^\"'`]*)[\"'`]", "class\\s*?=\\s*?[\"'`]([^\"'`]*)[\"'`]" },
					{ "className\\s*?=\\s*?[\"'`]([^\"'`]*)[\"'`]", "className\\s*?=\\s*?[\"'`]([^\"'`]*)[\"'`]" },
				},
			},
		},
	},
})
