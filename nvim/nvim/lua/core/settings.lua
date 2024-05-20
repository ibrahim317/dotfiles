vim.o.number = true
vim.o.tabstop=4
vim.o.shiftwidth=0
vim.o.cursorline = true
vim.o.scrolloff = 8
vim.o.cursorline = true
vim.o.relativenumber = true
vim.cmd('set clipboard=unnamedplus')
require('telescope').setup{ defaults = { file_ignore_patterns = {"node_modules"} } }
