return {
  {
    "echasnovski/mini.starter",
    version = false, -- always use the latest
    config = function()
      local starter = require("mini.starter")

      starter.setup({
        evaluate_single = true,
        items = {
          starter.sections.builtin_actions(),
          starter.sections.recent_files(5, true), -- show 5 recent files
          starter.sections.recent_files(5, false),
        },
        content_hooks = {
          starter.gen_hook.adding_bullet("✦ "),
          starter.gen_hook.aligning("center", "center"),
        },
      })
    end,
  },
}

