local n_opts = { silent = true, noremap = true }
local t_opts = { silent = true }

local keymap = vim.keymap.set
keymap("n", "<C-/>", ":grep ", n_opts)
keymap("n", "<C-p>", ":FZF<cr>", n_opts)
keymap("n", "<C-e>", ":e ", n_opts)
keymap("n", "<C-n>", ":SkyBison Dired <CR>", n_opts)
keymap("n", "<C-l>", ":CursorAgent<CR>", n_opts)
keymap("n", "<C-lA>", ":CursorAgentBuffer<CR>", n_opts)
keymap("n", "<C-f>", ":lua require('conform').format()<CR>:w<CR>", n_opts)
keymap("n", "<C-s>", ":Spectre<CR>", { desc = "Search & Replace (Spectre)" })
keymap("n", "<C-x>x", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
keymap('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
keymap(
	"n",
	"<C-x>l",
	"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
	{ desc = "LSP Definitions / references / ... (Trouble)" }
)
keymap("n", "<C-x>q", "<cmd>Trouble qflist toggle<cr><C-w>j", { desc = "Quickfix List (Trouble)" })

keymap("i", "<C-f>", ":lua require('conform').format()<CR>:w<CR>", n_opts)

keymap("v", "<C-la>", ":CursorAgentSelection<CR>", n_opts)

keymap("t", "<C-l>", "<C-\\><C-N>:CursorAgent<CR>", t_opts)

