" pathogen
execute pathogen#infect()
syntax enable
filetype plugin indent on

" color scheme
set t_Co=256
let g:solarized_termcolors=256
colorscheme solarized
set background=dark

" backupcopy
set backupcopy=yes

" tab settings
set shiftwidth=4 softtabstop=4 expandtab tabstop=8 smarttab
syntax on

" indentation settings
set ai "Auto indent
set si "Smart indent
set nu

" status line
set laststatus=2                        " status line always visible
set statusline=%F%m%r%h%w\ [%L][%{&ff}]%y[%p%%][%04l,%04v]
"              | | | | |  |   |      |  |     |    |
"              | | | | |  |   |      |  |     |    +-- current column
"              | | | | |  |   |      |  |     +-- current line
"              | | | | |  |   |      |  +-- current % into file
"              | | | | |  |   |      +-- current syntax 
"              | | | | |  |   +-- current file format
"              | | | | |  +-- number of lines
"              | | | | +-- preview flag
"              | | | +-- help flag
"              | | +-- readonly flag
"              | +-- modified flag 
"              +-- full file path

" insert newline below/above without entering insert mode
map <F8> o<Esc>
map <F9> O<Esc>

" search options
set hlsearch
set ignorecase

" replace trailing whitespace
au BufRead *.cfg retab
au BufRead,BufWrite *.cfg :%s/\s\+$//e
au BufRead,BufWrite *.sls :%s/\s\+$//e
au BufRead,BufWrite *.mako :%s/\s\+$//e
au BufRead,BufWrite *.py :%s/\s\+$//e
au BufRead,BufWrite *.js :%s/\s\+$//e
au BufRead,BufWrite *.jsx :%s/\s\+$//e
au BufRead,BufWrite *.sass :%s/\s\+$//e
au BufRead,BufWrite *.yaml :%s/\s\+$//e
au BufRead,BufWrite *.sh :%s/\s\+$//e

" pep-8 compliance
au FileType python match ErrorMsg '\%>79v.\+'
au FileType python match ErrorMsg '\s\+$'
au BufRead,BufWrite *.py :%s/\s\+$//e

" Highlight long lines
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
autocmd BufWinEnter * match OverLength /\%81v.\+/
autocmd InsertEnter * match OverLength /\%81v.\+/
autocmd InsertLeave * match OverLength /\%81v.\+/
autocmd BufWinLeave * call clearmatches()

" Syntastic Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_warning_symbol = "⚠"
let g:syntastic_aggregate_errors= 1
let g:syntastic_disabled_filetypes=['mako', 'js', 'css']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages= { "regex": ["E131", "E126", "W391", "E501"] } 

" Flake8 
let g:syntastic_python_checkers = ['flake8', 'pyflakes', 'pylint']

" ESLint
let g:syntastic_javascript_checkers = ['eslint']

" Viminfo
set viminfo='20,\"100
