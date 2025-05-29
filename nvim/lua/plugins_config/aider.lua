require('aider').setup({
  auto_manage_context = false,
  default_bindings = false,
  debug = true,
  vim = true, 
  args = "--model gemini/gemini-2.0-flash-001", 
  ignore_buffers = {},

  -- only necessary if you want to change the default keybindings. <Leader>C is not a particularly good choice. It's just shown as an example.
  vim.api.nvim_set_keymap('n', '<C-l>', ':AiderOpen --no-auto-commits<CR>', {noremap = true, silent = true})
})
