local settings = {
  go              = { expandtab = false, tabstop = 4, shiftwidth = 4 },
  lua             = { expandtab = true, tabstop = 2, shiftwidth = 2 },
  javascript      = { expandtab = true, tabstop = 2, shiftwidth = 2 },
  javascriptreact = { expandtab = true, tabstop = 2, shiftwidth = 2 },
  typescriptreact = { expandtab = true, tabstop = 2, shiftwidth = 2 },
  typescript      = { expandtab = true, tabstop = 2, shiftwidth = 2 },
  json            = { expandtab = true, tabstop = 2, shiftwidth = 2 },
  html            = { expandtab = true, tabstop = 2, shiftwidth = 2 },
  css             = { expandtab = true, tabstop = 2, shiftwidth = 2 },
  yaml            = { expandtab = true, tabstop = 2, shiftwidth = 2 },
  astro           = { expandtab = true, tabstop = 2, shiftwidth = 2 },
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = vim.tbl_keys(settings),
  callback = function(ev)
    local config = settings[ev.match]
    vim.opt_local.expandtab = config.expandtab
    vim.opt_local.tabstop = config.tabstop
    vim.opt_local.softtabstop = config.tabstop
    vim.opt_local.shiftwidth = config.shiftwidth
  end,
})
