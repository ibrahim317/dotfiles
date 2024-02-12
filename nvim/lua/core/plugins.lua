return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	-- telescope is the fizzy finder
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	-- treesitter is the tool that uses the colorscheme for programming languages in the right way
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end, }
		use {
			'nvim-tree/nvim-tree.lua',
			requires = {
				'nvim-tree/nvim-web-devicons', -- optional
			}, }
			use {
				'VonHeikemen/lsp-zero.nvim',
				branch = 'v3.x',
				requires = {
					--- Uncomment these if you want to manage the language servers from neovim
					{ 'williamboman/mason.nvim' },
					{ 'williamboman/mason-lspconfig.nvim' },

					-- LSP Support
					{ 'neovim/nvim-lspconfig' },
					-- Autocompletion
					{ 'hrsh7th/nvim-cmp' },
					{ 'hrsh7th/cmp-nvim-lsp' },
					{ 'L3MON4D3/LuaSnip' },
				}
			}
			-- autocompletion
			use("hrsh7th/cmp-buffer") -- source for text in buffer
			use("hrsh7th/cmp-path") -- source for file system paths

			-- snippets
			use("saadparwaiz1/cmp_luasnip") -- for autocompletion
			use("rafamadriz/friendly-snippets") -- useful snippets


			use 'kassio/neoterm'
			use 'morhetz/gruvbox'
			use 'xiyaowong/transparent.nvim'
		end)
