return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "macchiato", -- latte, frappe, macchiato, mocha
      integrations = {
        cmp = true,
        gitsigns = true,
        barbar = true,
        nvimtree = true,
        lualine = true,
        mason = true,
        fzf = true,
        noice = true,
        dashboard = true,
        indent_blankline = { enabled = true },
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end
  },
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    opts = {
      style = 'dark',
      transparent = false,
    },
    config = function(_, opts)
      -- require("onedark").setup(opts)
      -- require("onedark").load()

      -- local function set_color(group, options)
      --   vim.api.nvim_set_hl(0, group, options)
      -- end
      -- set_color("@operator", { fg = '#56B6C2' })
      -- set_color("@field", { fg = '#E06C75' })
      -- set_color("@string.escape", { fg = '#56B6C2' })
      -- set_color("@constructor", { link = "@type" })
      -- set_color("@type.qualifier", { fg = '#c678dd' })
      -- set_color("@type.builtin", { link = "@type" })
      -- set_color("@lsp.type.namespace", { fg = '#D18A66' })
      -- set_color("@lsp.mod.namespace", { fg = '#D18A66' })
      -- set_color("@lsp.type.enum", { fg = '#D19A66' })
      -- set_color("@lsp.type.enumMember", { fg = '#56B6C2' })
      -- set_color("@lsp.type.interface", { fg = '#98C379', italic = true })
      -- set_color("@lsp.type.parameter", { fg = '#ABB2BF', italic = true })
      -- set_color("@lsp.type.property", { fg = '#E06C75' })
      -- set_color("@lsp.type.selfKeyword", { fg = '#c678dd' })
      -- set_color("@lsp.type.selfTypeKeyword", { fg = '#c678dd' })
      -- set_color("@lsp.type.builtinType", { link = "@type" })
    end
  },
}
