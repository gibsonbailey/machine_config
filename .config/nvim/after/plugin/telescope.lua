local telescope = require("telescope")
local builtin = require("telescope.builtin")
local live_grep_args = require("telescope").load_extension("live_grep_args")

telescope.setup({
	extensions = {
		live_grep_args = {
			auto_quoting = true,
		},
	},
})

vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", live_grep_args.live_grep_args, {})
vim.keymap.set("n", "<leader><leader>", builtin.lsp_dynamic_workspace_symbols, {})
vim.keymap.set("n", "<leader>s", builtin.buffers, {})
