local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	"lua_ls",
	"basedpyright",
	"biome",
})

lsp.nvim_workspace()

lsp.configure("basedpyright", {
	root_dir = require("lspconfig.util").root_pattern(".git", "pyright.config", "setup.py", "setup.cfg"),
})

lsp.on_attach(function(_, bufnr)
	local opts = { buffer = bufnr, remap = false }
	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "<C-k>", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "<leader>vca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>vrr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "<leader>vrn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
end)

-- TODO: only remap tab if there's a suggestion
lsp.setup_nvim_cmp({
	mapping = lsp.defaults.cmp_mappings({
		["<Tab>"] = vim.NIL,
	}),
	completion = {
		autocomplete = false,
	},
})

lsp.setup()
