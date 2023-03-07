-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup({
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = true,
    auto_close = false,
    update_cwd = true,
})
