return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local config = require("lualine").get_config()
    config.options.theme = "horizon"

    local pending_workflows = require("git-needy").get_lualine_section()

    require("lualine").setup({
      --options = { theme = "horizon" },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff" },
        lualine_c = { "filename" },
        lualine_x = { "lsp_status", "filetype", pending_workflows },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
  end,
}
