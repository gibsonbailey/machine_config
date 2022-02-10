call plug#begin('~/.vim/plugged')
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
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
set laststatus=2
set background=dark
colorscheme PaperColor
let g:python_highlight_all = 1
