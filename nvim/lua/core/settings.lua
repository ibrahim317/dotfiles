vim.o.number = true
vim.o.tabstop = 4
vim.o.shiftwidth = 0
vim.o.cursorline = true
vim.o.scrolloff = 8
vim.o.cursorline = false
vim.o.relativenumber = true
vim.opt.fillchars = "eob: " -- removes ~ from blank lines
vim.opt.cursorline = true
vim.cmd("set clipboard=unnamedplus")
-- no background color
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd("highlight clear SignColumn")
		vim.cmd("highlight SignColumn ctermbg=none guibg=none")
		vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
		vim.cmd("hi VertSplit guibg=NONE ctermbg=NONE")
	end,
})
