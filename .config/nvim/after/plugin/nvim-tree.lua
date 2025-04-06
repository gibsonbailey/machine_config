-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true


local function my_on_attach(bufnr)
  local api = require("nvim-tree.api")
  -- Apply default Nvim-Tree mappings
  api.config.mappings.default_on_attach(bufnr)
  -- Override or add Shift+L to move to the right window
  vim.keymap.set("n", "<S-L>", "<C-w>l", { buffer = bufnr, noremap = true, desc = "Move to right window" })
end

-- empty setup using defaults
require("nvim-tree").setup({
  on_attach = my_on_attach,
	disable_netrw = true,
	hijack_netrw = true,
	update_cwd = true,
})

local function open_nvim_tree(data)
	-- buffer is a directory
	local directory = vim.fn.isdirectory(data.file) == 1

	if not directory then
		return
	end

	-- change to the directory
	vim.cmd.cd(data.file)

	-- open the tree
	require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	group = vim.api.nvim_create_augroup("NvimTree", { clear = true }),
	callback = open_nvim_tree,
})
