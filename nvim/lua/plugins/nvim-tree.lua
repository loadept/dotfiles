return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<CR>", mode = "n" }
  },
  opts = {
    view = { adaptive_size = true },
    sort = {
      sorter = "case_sensitive"
    },
    git = { ignore = false },
    filters = {
      dotfiles = false,
      custom = { "^.git$", "^node_modules$", "^venv$" }
    },
    renderer = {
      icons = {
        show = { folder_arrow = true },
        git_placement = "after",
        glyphs = {
          git = { ignored = "󰛑" },
        },
      },
      indent_markers = { enable = false },
    }
  }
}
