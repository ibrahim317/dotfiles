return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	-- telescope is the fizzy finder
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	-- treesitter is the tool that uses the colorscheme for programming languages in the right way
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,}
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional
		},}
		use {
			'VonHeikemen/lsp-zero.nvim',
			branch = 'v2.x',
			requires = {
				-- LSP Support
				{'neovim/nvim-lspconfig'},             -- Required
				{'williamboman/mason.nvim'},           -- Optional
				{'williamboman/mason-lspconfig.nvim'}, -- Optional

				-- Autocompletion
				{'hrsh7th/nvim-cmp'},     -- Required
				{'hrsh7th/cmp-nvim-lsp'}, -- Required
				{'L3MON4D3/LuaSnip'},     -- Required
			}
		}
	use 'kassio/neoterm'
    use 'morhetz/gruvbox'

	end)
