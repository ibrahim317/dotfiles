local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}
local hooks = require("ibl.hooks")
-- Create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#DC322F" })      -- Solarized Red
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#B58900" })  -- Solarized Yellow
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#268BD2" })    -- Solarized Blue
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#CB4B16" })  -- Solarized Orange
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#859900" })   -- Solarized Green
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#6C71C4" })  -- Solarized Violet
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#2AA198" })    -- Solarized Cyan
end)

vim.g.rainbow_delimiters = { highlight = highlight }
require("ibl").setup({ scope = { highlight = highlight } })

hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
