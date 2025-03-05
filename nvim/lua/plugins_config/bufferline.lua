require("bufferline").setup({
	options = {
		mode = "tabs", -- Set to "buffers" if you prefer buffer mode
		numbers = "none", -- Show buffer numbers (options: "none", "ordinal", "buffer_id")
		close_command = "bdelete! %d", -- Command to close a buffer
		right_mouse_command = "bdelete! %d", -- Right-click to close a buffer
		left_mouse_command = "buffer %d", -- Left-click to switch to a buffer
		middle_mouse_command = nil, -- Middle-click to close a buffer
		indicator = {
			icon = "▎", -- Indicator icon for the active buffer
			style = "underline", -- Indicator style (options: 'icon', 'underline', 'none')
		},
		buffer_close_icon = "", -- Close icon for buffers
		modified_icon = "●", -- Icon for modified buffers
		close_icon = "", -- Close icon for the tab bar
		left_trunc_marker = "", -- Left truncation marker
		right_trunc_marker = "", -- Right truncation marker
		name_formatter = function(buf) -- Format buffer names
			return vim.fn.fnamemodify(buf.name, ":t") -- Show only the filename
		end,
		max_name_length = 18, -- Maximum length of buffer names
		max_prefix_length = 15, -- Maximum length of buffer prefixes
		tab_size = 18, -- Size of tabs
		diagnostics = "nvim_lsp", -- Enable LSP diagnostics (requires nvim-lspconfig)
		diagnostics_update_in_insert = false, -- Update diagnostics in insert mode
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			return "(" .. count .. ")"
		end,
		offsets = {
			{
				filetype = "NvimTree", -- Offset for NvimTree
				text = "File Explorer",
				highlight = "Directory",
				text_align = "left",
			},
		},
		color_icons = true, -- Use colored icons
		show_buffer_icons = true, -- Show buffer icons
		show_buffer_close_icons = true, -- Show close icons
		show_close_icon = true, -- Show close icon for the tab bar
		show_tab_indicators = true, -- Show tab indicators
		separator_style = "slant", -- Separator style (options: "slant", "thick", "thin")
		enforce_regular_tabs = false, -- Force regular tabs
		always_show_bufferline = true, -- Always show the bufferline
	},
})
