return {
  "hrsh7th/nvim-cmp",
  version = false,
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  opts = function()
    local cmp = require("cmp")
    return {
      mapping = {
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<TAB>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<S-TAB>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
      })
    }
  end,
}
