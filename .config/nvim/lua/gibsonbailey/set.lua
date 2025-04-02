vim.opt.nu = true
vim.opt.relativenumber = true

local indent = 2

vim.opt.tabstop = indent
vim.opt.softtabstop = indent
vim.opt.shiftwidth = indent
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.clipboard = "unnamed"

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.filetype.add({
  filename = {
    [".shell_common"] = "sh",
    [".bashrc"] = "sh",
    [".bash_profile"] = "sh",
    [".zshrc"] = "zsh",
    [".ino"] = "cpp",
  },
})
