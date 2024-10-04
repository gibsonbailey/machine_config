-- Recognize .ino files as .cpp
vim.api.nvim_command('autocmd BufRead,BufNewFile *.ino set filetype=cpp')

require("gibsonbailey.set")
require("gibsonbailey.remap")
require("gibsonbailey.commands")
