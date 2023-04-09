local M = {}

function M.run_bash_command(command)
    local status, exit_code = os.execute(command)
    if not status then
        print("Error: Failed to execute the Bash command.")
        if exit_code == nil then
            print("Exit code is unavailable.")
        else
            print("Bash command failed with exit code: " .. exit_code)
        end
        return false, exit_code
    else
        print("Success: Bash command executed.")
        if exit_code == nil then
            print("Exit code is unavailable.")
        else
            print("Bash command exit code: " .. exit_code)
        end
        return true, exit_code
    end
end

function M.run_bash_command_with_output(command)
    local output = {}
    local file_handle = io.popen(command)
    if file_handle then
        for line in file_handle:lines() do
            table.insert(output, line)
        end
        file_handle:close()
    else
        print("Error: Failed to execute the Bash command.")
        return false, nil
    end

    local stdout = table.concat(output, "\n")
    print("Command output:\n" .. stdout)

    return true, stdout
end

return M
