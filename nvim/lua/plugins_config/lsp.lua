require("mason").setup()
require("mason-lspconfig").setup()

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- After setting up mason-lspconfig you may set up servers via lspconfig
require("lspconfig").lua_ls.setup({

	capabilities = capabilities,
	settings = {
		Lua = {
			completion = {
				callSnippet = "Both",
			},
			diagnostics = {
				disable = { "incomplete-signature-doc", "missing-fields" },
				-- You could add more globals i.e., "vim" here, albeit w/o intellisense
				globals = { "MiniMap" },
			},
			hint = {
				enable = true,
				arrayIndex = "Disable",
			},
			telemetry = { enable = false },
			chcekThirdParty = false,
		},
	},
})
require("lazydev").setup({
	enable = true, -- Ensure it's enabled
})
require("lspconfig").pyright.setup({
	capabilities = capabilities,
	flags = {
		debounce_text_changes = 150,
	},
})

require("lspconfig").phpactor.setup({
	cmd = { "phpactor", "language-server" },
	filetypes = { "php" },
	root_dir = require("lspconfig").util.root_pattern("composer.json", ".git"),
	on_attach = function(_, bufnr)
		print("Phpactor attached to buffer " .. bufnr)
	end,
	capabilities = vim.lsp.protocol.make_client_capabilities(), -- Customize if needed
})

require("lspconfig").rust_analyzer.setup({
	capabilities = capabilities,
})
require("lspconfig").ts_ls.setup({
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
})

require("lspconfig").dartls.setup({
	cmd = { "dart", "language-server", "--protocol=lsp" },
})
require("lspconfig").volar.setup({})
