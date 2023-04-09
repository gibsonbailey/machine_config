# Run command like :LL
vim.cmd("command! LL lua require('gibsonbailey.functions').run_bash_command_with_output('ls -l')")


vim.cmd("command! MM lua require('gibsonbailey.functions').run_bash_command_with_output('docker compose exec django python manage.py makemigrations')")
vim.cmd("command! Migrate lua require('gibsonbailey.functions').run_bash_command_with_output('docker compose exec django python manage.py migrate')")
