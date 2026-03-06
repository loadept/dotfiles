return {
  "romgrk/barbar.nvim",
  event = "VeryLazy",
  dependencies = {
    'lewis6991/gitsigns.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  init = function() vim.g.barbar_auto_setup = false end,
  keys = {
    { "<TAB>", "<cmd>BufferNext<CR>", mode = "n" },
    { "<S-TAB>", "<cmd>BufferPrevious<CR>", mode = "n" },
    { "<C-b>", "<cmd>BufferClose<CR>", mode = "n" },
    { "<A-,>", "<cmd>BufferMovePrevious<CR>", mode = "n" },
    { "<A-.>", "<cmd>BufferMoveNext<CR>", mode = "n" },
    { "<A-p>", "<cmd>BufferPin<CR>", mode = "n" },
    { "<leader>b", "<cmd>BufferCloseAllButCurrent<CR>", mode = "n" },
  },
  opts = {
    animation = true,
    icons = {
      preset = "default",
    },
    sidebar_filetypes = {
      ["NvimTree"] = {
        event = 'BufWinLeave',
        text = 'File Explorer',
        align = 'center',
      },
    },
    filetype = {
      custom_colors = true,
    },
    no_name_title = "Empty File",
  },
}
