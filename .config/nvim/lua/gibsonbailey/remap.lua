vim.keymap.set("i", "jj", "<Esc>")

-- Open/close file tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Autoformat
vim.keymap.set("n", ",", function() vim.cmd("silent! FormatWrite") end)

-- Change windows quickly
vim.keymap.set("n", "H", "<C-w>h")
vim.keymap.set("n", "L", "<C-w>l")
vim.keymap.set("n", "J", "<C-w>j")
vim.keymap.set("n", "K", "<C-w>k")

-- Search and replace current word
vim.keymap.set("n", "<leader>r",
               [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Switch to last buffer
vim.keymap.set("n", "<leader>b", "<C-^>")

-- Close current buffer
vim.keymap.set("n", "<leader>w", ":bd<CR>")


-- Search and replace current word
vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "Search current word"
})
vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    desc = "Search current word"
})

-- Toggle Spectre
vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
    desc = "Toggle Spectre"
})


-- llm tool
-- vim.keymap.set('n', '<leader>l', require('llm_tool').show_options,
--                {noremap = true, silent = true})

-- -- Do the same thing in visual line mode
-- vim.keymap.set('x', '<leader>l', require('llm_tool').show_options,
--                {noremap = true, silent = true})

-- And in visual mode
vim.keymap.set('v', '<leader>l', require('llm_tool').show_options,
               {noremap = true, silent = false})

-- vim.keymap.set('v', '<leader>l', function()
--   local llm_tool = require('llm_tool')
--   llm_tool.capture_visual_marks()
--   llm_tool.show_options()
-- end, {noremap = true, silent = false})
