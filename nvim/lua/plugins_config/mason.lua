-- Ensure Mason is installed
require('mason').setup()

-- Ensure Mason LSP is installed
require('mason-lspconfig').setup({
  ensure_installed = {
    "tsserver",
	"tailwindcss",
    "pylsp",
	"rust_analyzer",
	"lua_ls",
  }
})

-- Automatically install formatters using Mason
require('mason-tool-installer').setup({
  ensure_installed = {
    "prettier",
    "clang-format",
	"clangd",
	"pretty-php"
  },
  auto_update = true,
  run_on_start = true,
})
