vim.keymap.set("i", "jj", "<Esc>")

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>")


-- Change windows quickly
vim.keymap.set("n", "H", "<C-w>h")
vim.keymap.set("n", "L", "<C-w>l")
vim.keymap.set("n", "J", "<C-w>j")
vim.keymap.set("n", "K", "<C-w>k")


-- Search and replace current word
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])


-- Buffer management
vim.keymap.set("n", "<leader>b", "<C-^>")
vim.keymap.set("n", "<leader>w", ":bd<CR>")
