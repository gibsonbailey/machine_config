local prettierd = { require("formatter.filetypes.typescript").prettierd }

require("formatter").setup({
	filetype = {
		lua = { require("formatter.filetypes.lua").stylua },
		python = {
			require("formatter.filetypes.python").autopep8,
			require("formatter.filetypes.python").isort,
		},
		javascript = prettierd,
		typescript = prettierd,
		typescriptreact = prettierd,
		javascriptreact = prettierd,
		json = { require("formatter.filetypes.json").prettierd },
		html = { require("formatter.filetypes.html").prettierd },
		css = { require("formatter.filetypes.css").prettierd },
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	group = vim.api.nvim_create_augroup("Formatter", { clear = true }),
	callback = function()
		vim.cmd("silent! Format")
	end,
})
