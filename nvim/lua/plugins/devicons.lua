return {
  "nvim-tree/nvim-web-devicons",
  opts = {
    strict = true,
    override_by_filename = {
      [".gitignore"] = {
        icon = "",
        color = "#f1502f",
        name = "Gitignore"
      },
      ["go.mod"] = {
        icon = "󰟓",
        color = "#ec407a",
        name = "GoMod",
      },
      ["go.sum"] = {
        icon = "󰟓",
        color = "#ec407a",
        name = "GoSum",
      },
      ["nginx.conf"] = {
        icon = "",
        color = "#00ff23",
        name = "NginxConf",
      },
    },
  }
}
