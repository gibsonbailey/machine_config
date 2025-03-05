local M = {}

M.visual_start = nil
M.visual_end = nil

local function clear_visual_marks()
	M.visual_start = nil
	M.visual_end = nil
end

local options = {
	{
		label = "Replace highlighted text",
		action = function()
			local start_row, start_col = unpack(M.visual_start or { 0, 0 })
			local end_row, end_col = unpack(M.visual_end or { 0, 0 })

			print("Visual start: ", start_row, start_col)
			print("Visual end: ", end_row, end_col)

			local input = vim.fn.input("Replace with: ")
			if input and #input > 0 then
				-- Convert to zero-based indexing for the API
				start_row = start_row - 1
				start_col = start_col - 1
				end_row = end_row - 1
				-- end_col can be used as-is for exclusive range

				vim.api.nvim_buf_set_text(0, start_row, start_col, end_row, end_col, { input })
			else
				print("No input provided.")
			end
			clear_visual_marks()
		end,
	},
	{
		label = "Option 2: Execute a command",
		action = function()
			print("Executing a command...")
		end,
	},
	{
		label = "Option 3: Open a file",
		action = function()
			vim.cmd("edit newfile.txt")
		end,
	},
	{
		label = "Option 4: Display a message",
		action = function()
			print("Hello from LLM Tool!")
		end,
	},
}

-- Pre-capture marks before showing options
function M.capture_visual_marks()
	-- Exit visual mode
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "x", false)

	-- After returning to normal mode, the marks should be set
	vim.cmd("redraw")

	local start_pos = vim.fn.getpos("'<")
	local end_pos = vim.fn.getpos("'>")

	-- Assign to visual marks
	M.visual_start = { start_pos[2], start_pos[3] }
	M.visual_end = { end_pos[2], end_pos[3] }
end

function M.show_options()
	M.capture_visual_marks()
	require("telescope.pickers")
		.new({}, {
			prompt_title = "LLM Tool Options",
			finder = require("telescope.finders").new_table({
				results = vim.tbl_map(function(option)
					return option.label
				end, options),
			}),
			sorter = require("telescope.config").values.generic_sorter({}),
			attach_mappings = function(_, map)
				map("i", "<CR>", function(prompt_bufnr)
					local selection = require("telescope.actions.state").get_selected_entry()
					require("telescope.actions").close(prompt_bufnr)

					for _, option in ipairs(options) do
						if option.label == selection.value then
							option.action()
							return
						end
					end
				end)
				return true
			end,
		})
		:find()
end

return M
