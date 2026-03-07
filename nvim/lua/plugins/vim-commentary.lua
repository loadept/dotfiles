return {
  "tpope/vim-commentary",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { "<leader>/", "<cmd>Commentary<cr>", mode = { "n", "v" } },
  },
}
