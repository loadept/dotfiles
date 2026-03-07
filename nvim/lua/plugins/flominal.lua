-- Custom floating termina plugin
return {
  name = "flominal",
  dir = vim.fn.stdpath("config"),
  keys = {
    { "<leader>tt", "<cmd>ToggleFlominal<cr>", mode = { "n", "t" } },
  },
  config = function()
    local function floating_window(buf)
      local screen_w = vim.o.columns
      local screen_h = vim.o.lines

      local width = math.floor(screen_w * 0.7)
      local height = math.floor(screen_h * 0.7)
      local col = math.floor((screen_w - width) / 2)
      local row = math.floor((screen_h - height) / 2)

      buf = vim.api.nvim_buf_is_valid(buf) and buf or vim.api.nvim_create_buf(false, true)

      local win_config = {
        relative = "editor",
        width = width,
        height = height,
        col = col,
        row = row,
        style = "minimal",
        border = "rounded",
      }
      local win = vim.api.nvim_open_win(buf, true, win_config)

      return { buf = buf, win = win }
    end


    local state = {
      floating = {
        buf = -1,
        win = -1,
      }
    }

    local function toggle_terminal()
      if not vim.api.nvim_win_is_valid(state.floating.win) then
        state.floating = floating_window(state.floating.buf)
        if vim.bo[state.floating.buf].buftype ~= "terminal" then
          vim.cmd.terminal()
        end
        vim.cmd.startinsert()
      else
        vim.api.nvim_win_hide(state.floating.win)
      end
    end

    vim.api.nvim_create_user_command("ToggleFlominal", toggle_terminal, {})
  end
}
