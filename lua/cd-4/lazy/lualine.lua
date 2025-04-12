return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local config = require("lualine").get_config()
    config.options.theme = "horizon"

    local time = function()
      local num_workflows = 0
      return " " .. num_workflows
    end

    local something = {
      time,
      color = function()
        local num_workflows = 0
        local bg_colors = {
          none = "#00820d",
          low = "#e8eb42",
          med = "#db8412",
          high = "#b8361c",
        }
        local fg_colors = {
          none = "#dddddd",
          low = "#222222",
          med = "#222222",
          high = "#dddddd",
        }

        local color_key = "none"
        if num_workflows > 4 then
          color_key = "high"
        elseif num_workflows > 2 then
          color_key = "med"
        elseif num_workflows > 0 then
          color_key = "low"
        end

        return {
          fg = fg_colors[color_key],
          bg = bg_colors[color_key],
          gui = "bold",
        }
      end,
      on_click = function()
        print("You clicked the mode!")
      end,
    }

    require("lualine").setup({
      --options = { theme = "horizon" },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff" },
        lualine_c = { "filename" },
        lualine_x = { "filetype", something },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })

    --[[
    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "horizon",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false,
        refresh = {
          statusline = 100,
          tabline = 100,
          winbar = 100,
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    })
    --]]
    --
  end,
}
