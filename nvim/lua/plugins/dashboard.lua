return {
  "nvimdev/dashboard-nvim",
  lazy = false,
  opts = function()
    local logo = [[
                __                
          ╭~.-::::::-.~╮          
       .:-::::::::::::::-:.       
       '_.:: ⌒  ::   ⌒ ::._'      
        .:(  ⏣  ):(  ⏣   ):.      
        '::: ‿ (..) ‿  :::.       
        ':::::::ᕫᕫ:::::::'        
      , .::::::::::::::::. ,      
     ~｟O::::./####\.::::O｠~     
        ~::::{##  ##}::::~        
        ':::::\####/:::::'        
         .::::::::::::::.         
          ˳oO::::::::Oo˳          
    ]]
    logo = string.rep("\n", 8) .. logo .. "\n\n"

    local opts = {
      theme = "doom",
      hide = {
        statusline = false,
      },
      config = {
        header = vim.split(logo, "\n"),
        center = {
          { action = "FzfLua files", desc = " Find File", icon = " ", key = "f" },
          { action = "FzfLua git_status", desc = " Git Status", icon = " ", key = "s" },
          { action = "enew | startinsert", desc = " New File", icon = " ", key = "n" },
          { action = "FzfLua oldfiles", desc = " Recent Files", icon = " ", key = "r" },
          { action = "FzfLua live_grep", desc = " Find Text",  icon = " ", key = "g" },
          { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit", icon = " ", key = "q" },
        },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
        end,
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      button.key_format = "  %s"
    end
    return opts
  end,
}
