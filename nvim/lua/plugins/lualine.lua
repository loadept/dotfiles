return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  opts = function()
    local function caps_lock()
      local f = io.open("/sys/class/leds/input4::capslock/brightness", "r")
      if f then
        local val = f:read("*n")
        f:close()
        if val == 1 then return "󰪛 CAPS" end
      end
      return ""
    end

    return {
      options = {
        globalstatus = true,
        refresh = {
          statusline = 700,
        },
      },
      sections = {
        lualine_c = {
          {
            "filetype",
            separator = "",
            icon_only = true,
            padding = { left = 1, right = 0 },
          },
          {
            "filename",
            file_status = true,
            symbols = { modified = " ", readonly = "󰌾" },
            padding = { left = 0, right = 1 },
          },
        },
        lualine_x = {
          {
            caps_lock,
            color = { fg = "#e78284" },
          },
          "fileformat",
        }
      },
      extensions = { "nvim-tree", "fzf", "mason" },
    }
  end
}
