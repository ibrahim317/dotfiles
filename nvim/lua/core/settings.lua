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

vim.g.neovide_scale_factor = 1.0
local change_scale_factor = function(delta)
	vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end
vim.keymap.set("n", "<C-=>", function()
	change_scale_factor(1.25)
end)
vim.keymap.set("n", "<C-->", function()
	change_scale_factor(1 / 1.25)
end)
