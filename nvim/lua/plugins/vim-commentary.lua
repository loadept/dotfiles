return {
  "tpope/vim-commentary",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { "<leader>/", ":Commentary<cr>", mode = { "n", "v" } },
  },
}
