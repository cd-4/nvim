return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "Isrothy/lualine-diagnostic-message", -- Add it to dependencies
  },
  config = function()
    local prose = require('nvim-prose')
    local config = require("lualine").get_config()
    config.options.theme = "horizon"

    local pending_workflows = require("git-needy").get_lualine_section()

    require("lualine").setup({
      --options = { theme = "horizon" },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff" },
        lualine_c = {
          { "filename" },
          { "diagnostic-message" },
        },
        lualine_x = {
          { prose.word_count,   cond = prose.is_available },
          { prose.reading_time, cond = prose.is_available },
          "lsp_status",
          pending_workflows,
        },
        lualine_y = {
          {
            "line_diagnostics",
            sources = { "nvim_diagnostic" }, -- Uses built-in LSP diagnostics
            sections = { "error", "warn", "info", "hint" },
            symbols = { error = " ", warn = " ", info = " ", hint = " " },
            colored = true,
            update_in_insert = false,
            always_visible = false,
          },
        },
        lualine_z = { "location" },
      },
    })
  end,
}
