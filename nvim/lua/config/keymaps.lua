-- Save with CTRL S
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>")
vim.keymap.set("i", "<C-s>", "<cmd>w<cr>")

-- Exit with CTRL Q
vim.keymap.set("n", "<C-q>", "<cmd>qa<cr>")
-- vim.keymap.set("i", "<C-q>", "<cmd>q<cr>")

-- Exit from quickfix list
vim.keymap.set("n", "<leader>cc", "<cmd>cclose<cr>")
