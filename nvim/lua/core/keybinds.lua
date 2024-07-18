vim.g.mapleader = " "
-- My own nvigation keybinds

vim.keymap.set("i", "jj", "<ESC>")
vim.keymap.set("t", "jj", "<LeftMouse>")
vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("i", "<C-s>", "<ESC>:w<CR>")
vim.api.nvim_set_keymap("n", "q", ":q", { noremap = true, silent = false })
vim.keymap.set("n", "<C-t>", ":tabnew<CR>")
vim.keymap.set("n", "<C-i>", ":tabnext<CR>")
vim.keymap.set("n", "<S-w>", ":tabclose<CR>")

-- search highlight
vim.keymap.set("n", "<C-l>", ":noh<CR>")

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader><leader>", builtin.find_files, {})
vim.api.nvim_set_keymap("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- nvim-tree
vim.keymap.set("n", "<leader>n", ":NvimTreeFindFileToggle<CR>")

-- shell commands
vim.api.nvim_set_keymap("n", "<leader>z", "q:i!", { noremap = true, silent = false })

-- lsp
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", {})
