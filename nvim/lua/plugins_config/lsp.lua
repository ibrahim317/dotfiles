require("mason").setup()
require("mason-lspconfig").setup()

local capabilities = require("cmp_nvim_lsp").default_capabilities()

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
	capabilities = capabilities,
})
