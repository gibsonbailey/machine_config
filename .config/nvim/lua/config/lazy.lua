-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		{
			"neanias/everforest-nvim",
			version = false,
			lazy = false,
			priority = 1000, -- make sure to load this before all the other start plugins
			-- Optional; default configuration will be used if setup isn't called.
			config = function()
				require("everforest").setup({
					background = "hard",
				})
			end,
		},
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			config = function()
				local configs = require("nvim-treesitter.configs")

				configs.setup({
					ensure_installed = { "c", "lua", "query", "javascript", "html", "typescript", "python" },
					sync_install = false,
					auto_install = true,
					highlight = { enable = true },
					indent = { enable = true },
				})
			end,
		},
		{
			"akinsho/bufferline.nvim",
			version = "*",
			dependencies = "nvim-tree/nvim-web-devicons",
		},
		{
			"nvim-telescope/telescope.nvim",
			tag = "0.1.8",
			dependencies = { "nvim-lua/plenary.nvim" },
		},

		{ "neovim/nvim-lspconfig" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "L3MON4D3/LuaSnip" },
		{ "nvim-tree/nvim-tree.lua" },

		-- Quick line commenting with `gcc` and block commenting with `V (highlight block) gc`
		{ "tpope/vim-commentary" },

		-- Makes auto-comment cursor position dependent
		{ "JoosepAlviste/nvim-ts-context-commentstring" },

		-- Copilot autocompletion
		{ "github/copilot.vim" },

		-- Formatting
		{ "mhartington/formatter.nvim" },

		-- Search and replace
		{
			"nvim-pack/nvim-spectre",
			requires = { { "nvim-lua/plenary.nvim" } },
		},

		{ "christoomey/vim-tmux-navigator" },

		-- Formatting
		{ "mhartington/formatter.nvim" },

		{
			"nvimdev/lspsaga.nvim",
			config = function()
				require("lspsaga").setup({
					code_action = {
						enable = true,
						show_server_name = true,
						extend_gitsigns = false,
					},
					-- disable everything else
					finder = { enable = false },
					definition = { enable = false },
					hover = { enable = false },
					rename = { enable = false },
					diagnostic = { enable = false },
					outline = { enable = false },
					lightbulb = { enable = false },
					beacon = { enable = false },
					symbol_in_winbar = { enable = false },
					ui = { border = "rounded" },
				})
			end,
			dependencies = {
				"nvim-treesitter/nvim-treesitter",
				"nvim-tree/nvim-web-devicons",
			},
		},
		{
			"f-person/auto-dark-mode.nvim",
			opts = {
				{
					set_dark_mode = function()
						vim.api.nvim_set_option_value("background", "dark", {})
					end,
					set_light_mode = function()
						vim.api.nvim_set_option_value("background", "light", {})
					end,
					update_interval = 3000,
					fallback = "dark",
				},
			},
		},
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "everforest" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})
