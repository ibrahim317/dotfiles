require("mason").setup()
require("mason-lspconfig").setup()
local mason_registry = require('mason-registry')
local ts_plugin_path = mason_registry.get_package('vue-language-server'):get_install_path() .. '/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin'


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
require("lspconfig").intelephense.setup({
	capabilities = capabilities,
	flags = {
		debounce_text_changes = 150,
	},
	settings = {
		intelephense = {
			stubs = {
				"Core",
				"Reflection",
				"SPL",
				"SimpleXML",
				"ctype",
				"date",
				"exif",
				"filter",
				"hash",
				"imagick",
				"json",
				"pcre",
				"random",
				"standard",
			},
		},
	},
})

require("lspconfig").rust_analyzer.setup({
	capabilities = capabilities,
})
require("lspconfig").ts_ls.setup({
    init_options = {
      plugins = {
        {
          name = '@vue/typescript-plugin',
          location = ts_plugin_path,
          -- If .vue file cannot be recognized in either js or ts file try to add `typescript` and `javascript` in languages table.
          languages = { 'vue' },
        },
      },
    },
    filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
})

require("lspconfig").dcmls.setup({
	capabilities = capabilities,
})
require("lspconfig").volar.setup({})
