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
require('lazydev').setup({
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
require("lspconfig").dcmls.setup({
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

