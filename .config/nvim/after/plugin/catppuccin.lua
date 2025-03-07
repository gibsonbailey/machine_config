require("catppuccin").setup({
	flavour = "mocha", -- Default flavour
})

-- Automatically set the theme based on the OS theme
local light_theme = "catppuccin-latte"
local dark_theme = "catppuccin-mocha"

local function set_theme()
	-- Detect OS and check theme
	local mode
	if vim.loop.os_uname().sysname == "Darwin" then
		-- macOS: Check theme using osascript
		local handle = io.popen(
			"osascript -e 'tell application \"System Events\" to tell appearance preferences to return dark mode'"
		)
		mode = handle:read("*a")
		handle:close()
		mode = mode:find("true") and "dark" or "light"
	else
		-- Linux: Check theme using darkman
		local handle = io.popen("darkman get")
		mode = handle:read("*a")
		handle:close()
		mode = mode:find("dark") and "dark" or "light"
	end

	-- Set theme based on mode
	if mode == "dark" then
		vim.o.background = "dark"
		vim.cmd.colorscheme(dark_theme)
	else
		vim.o.background = "light"
		vim.cmd.colorscheme(light_theme)
	end
end

-- Initial theme setup
set_theme()

-- Periodic check (every 5 seconds)
local timer = vim.loop.new_timer()
timer:start(0, 5000, vim.schedule_wrap(set_theme))
