vim.g.mapleader = ' '
-- My own nvigation keybinds

vim.keymap.set('i','jj','<ESC>')
vim.keymap.set('t','jj','<LeftMouse>')
vim.keymap.set('n', '<C-s>', ':w<CR>')
vim.keymap.set('i', '<C-s>', '<ESC>:w<CR>')
vim.keymap.set('n','q',':q')
vim.keymap.set('n','<leader>e',':Ex<CR>')
vim.keymap.set('n','<C-t>',':tabnew<CR>')
vim.keymap.set('n','<C-i>',':tabnext<CR>')
vim.keymap.set('n','<S-w>',':tabclose<CR>')




-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader><leader>', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- nvim-tree
vim.keymap.set('n','<leader>n',':NvimTreeFindFileToggle<CR>')


-- neoterm
vim.keymap.set('n','<leader>ts',':Tnew<CR>')
vim.keymap.set('n','<leader>tv',':vert Tnew<CR>')





