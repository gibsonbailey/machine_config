call plug#begin('~/.vim/plugged')
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'
call plug#end()

set tabstop=4 shiftwidth=4 expandtab
set mouse=a
set number
set autoindent

set wrapmargin=5

set t_Co=256 

imap jj <Esc>
nnoremap <silent> <F9> :tabp <CR>
nnoremap <silent> <F10> :tabn <CR>
nnoremap <silent> <C-f> :Files <CR>
nnoremap <silent> <C-f><C-f> :Files 
nnoremap <silent> <S-F><S-F> :Rg <CR>

let g:fzf_action = {
  \ 'return': 'tab split',
  \ 'ctrl-j': 'split',
  \ 'ctrl-k': 'vsplit' }

syntax enable
set statusline=%{gutentags#statusline()}
set laststatus=2
set background=dark
colorscheme PaperColor
let g:python_highlight_all = 1

let g:gutentags_ctags_exclude = [
      \ '*.git', '*.svg', '*.hg',
      \ '*/tests/*',
      \ 'build',
      \ 'dist',
      \ '*sites/*/files/*',
      \ 'bin',
      \ 'node_modules',
      \ '*.js',
      \ 'bower_components',
      \ 'cache',
      \ 'compiled',
      \ 'docs',
      \ 'example',
      \ 'bundle',
      \ 'vendor',
      \ '*.md',
      \ '*-lock.json',
      \ '*.lock',
      \ '*bundle*.js',
      \ '*build*.js',
      \ '.*rc*',
      \ '*.json',
      \ '*.min.*',
      \ '*.map',
      \ '*.bak',
      \ '*.zip',
      \ '*.pyc',
      \ '*.class',
      \ '*.sln',
      \ '*.Master',
      \ '*.csproj',
      \ '*.tmp',
      \ '*.csproj.user',
      \ '*.cache',
      \ '*.pdb',
      \ 'tags*',
      \ 'cscope.*',
      \ '*.css',
      \ '*.less',
      \ '*.scss',
      \ '*.exe', '*.dll',
      \ '*.mp3', '*.ogg', '*.flac',
      \ '*.swp', '*.swo',
      \ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
      \ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
      \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
      \ ]
