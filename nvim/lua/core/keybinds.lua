vim.g.mapleader = " "
-- My own nvigation keybinds

vim.keymap.set("i", "jj", "<ESC>")
vim.keymap.set("t", "jj", "<LeftMouse>")
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-s>", "<ESC>:w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-t>", ":tabnew<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Tab>", ":tabnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>w", ":tabclose<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-i>", ":Format<CR>", { noremap = true, silent = true })

-- search highlight
vim.api.nvim_set_keymap("n", "<C-;>", ":noh<CR>:Noice dismiss<CR>", { noremap = true, silent = true })

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.api.nvim_set_keymap("n", "<C-f>", "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- nvim-tree
vim.api.nvim_set_keymap("n", "<leader>n", ":NvimTreeFindFileToggle<CR>", { noremap = true, silent = true })

-- shell commands
vim.api.nvim_set_keymap("n", "<leader>z", "q:i!", { noremap = true, silent = false })

-- lsp
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", {})
