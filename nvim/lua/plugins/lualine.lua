return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      vim.o.statusline = " "
    else
      vim.o.laststatus = 0
    end
  end,
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
        theme = "auto",
        disabled_filetypes = { statusline = { "dashboard" } },
        globalstatus = true,
        refresh = { statusline = 500 },
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
          "selectioncount",
          "fileformat",
        }
      },
      extensions = {
        "nvim-tree",
        "lazy",
        "fzf",
        "mason",
        "quickfix",
      },
    }
  end
}
