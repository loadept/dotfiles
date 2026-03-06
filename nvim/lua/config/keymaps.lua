-- Save with CTRL S
vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>")

-- Exit with CTRL Q
vim.keymap.set("n", "<C-q>", ":qa<CR>")
vim.keymap.set("i", "<C-q>", "<Esc>:q<CR>")

-- Exit from quickfix list
vim.keymap.set("n", "<leader>cc", "<cmd>cclose<CR>")
