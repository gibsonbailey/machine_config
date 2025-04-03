local prettierd = { require("formatter.filetypes.typescript").prettierd }

require("formatter").setup({
	filetype = {
		lua = { require("formatter.filetypes.lua").stylua },
		python = {
			require("formatter.filetypes.python").black,
			require("formatter.filetypes.python").isort,
		},
		javascript = { require("formatter.filetypes.javascript").prettierd },
		typescript = prettierd,
		typescriptreact = prettierd,
		javascriptreact = prettierd,
		json = { require("formatter.filetypes.json").prettierd },
		html = { require("formatter.filetypes.html").prettierd },
		css = { require("formatter.filetypes.css").prettierd },
		sh = { require("formatter.filetypes.sh").shfmt },
		cpp = {
			require("formatter.filetypes.cpp").clangformat,
			function()
				return {
					exe = "clang-format",
					args = { "--style={ColumnLimit: 0}" },
					stdin = true,
				}
			end,
		},
		arduino = { require("formatter.filetypes.cpp").clangformat },
		zsh = { require("formatter.filetypes.zsh").beautysh },
		zshrc = { require("formatter.filetypes.zsh").beautysh },
	},
})
