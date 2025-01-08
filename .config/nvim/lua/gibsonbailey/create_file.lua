local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local M = {}

function M.create_file_in_selected_dir()
    builtin.find_files({
        prompt_title = "Select Directory",
        -- Only show directories:
        find_command = {"fd", "--type", "d", "--hidden", "--follow"},
        attach_mappings = function(prompt_bufnr, map)
            local create = function()
                local selection = action_state.get_selected_entry()
                actions.close(prompt_bufnr)
                local dir = selection.value
                vim.ui.input({prompt = "New file name: "}, function(file)
                    if file and file ~= "" then
                        vim.cmd("edit " .. dir .. "/" .. file)
                    end
                end)
            end
            map("i", "<CR>", create)
            map("n", "<CR>", create)
            return true
        end
    })
end

return M
