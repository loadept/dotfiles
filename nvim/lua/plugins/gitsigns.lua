return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { "<leader>gp", "<cmd>Gitsigns prev_hunk<CR>", mode = "n" },
    { "<leader>gn", "<cmd>Gitsigns next_hunk<CR>", mode = "n" },
    { "<leader>gh", "<cmd>Gitsigns preview_hunk<CR>", mode = "n" },
    { "<leader>gd", "<cmd>Gitsigns diffthis<CR>", mode = "n" },
    { "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", mode = "n" },
    { "<leader>gb", "<cmd>Gitsigns blame_line<CR>", mode = "n" },
  },
  opts = {
    current_line_blame = true,
    current_line_blame_opts = {
      delay = 600
    },
    current_line_blame_formatter = '    <author>, <author_time:%R>   <summary>',
  }
}
