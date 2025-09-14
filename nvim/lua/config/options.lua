vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1		
vim.opt.clipboard = "unnamedplus"
vim.g.fzf_layout = { down = '40%' }
-- search all subdirs
vim.opt.path:append("**")
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.wo.relativenumber = true

-- ignore junk dirs and files
vim.opt.wildignore:append {
  "*/node_modules/*",
  "*/.git/*",
  "*/.next/*",
  "*/dist/*",
  "*/build/*",
  "*/coverage/*",
  "*/venv/*",
  "*/__pycache__/*",
}
vim.cmd("colorscheme solarized-osaka")

