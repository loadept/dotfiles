-- Load map loader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


-- [Global personal configs]
-- default tabs
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Indentation
vim.opt.smartindent = true

-- Disable mouse
vim.opt.mouse = ""

-- Don't wrap text
vim.opt.wrap = false

-- Searching
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Colors
vim.opt.termguicolors = true

-- Vertical markers
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"

-- Don't load netrw because we use nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Show a line on mouse position
vim.opt.cursorline = true

-- Show more lines
vim.opt.scrolloff = 10

-- Smooth
vim.opt.smoothscroll = true

-- Confirm to save changes before exiting modified buffer
vim.opt.confirm = true

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
