return {
  "tpope/vim-commentary",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { "<leader>/", ":Commentary<CR>", mode = { "n", "v" } },
  },
}
