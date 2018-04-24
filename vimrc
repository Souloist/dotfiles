filetype plugin indent on

call plug#begin()
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ekalinin/Dockerfile.vim'
Plug 'w0rp/ale'
Plug 'alfredodeza/coveragepy.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'wincent/command-t'
Plug 'vim-scripts/SQLUtilities'
Plug 'vim-scripts/Align'
call plug#end()

" color scheme
set t_Co=256
syntax on
set background=dark
colorscheme hybrid_material

" Backspace fixes
set backspace=indent,eol,start

" backupcopy
set backupcopy=yes

" UTF8 Support
set encoding=utf-8

" tab settings
set shiftwidth=4 softtabstop=4 expandtab tabstop=8 smarttab

" Set fold off at start
set foldlevelstart=10

" indentation settings
set ai "Auto indent
set si "Smart indent
set number relativenumber

" status line
set laststatus=2                        " status line always visible
set noshowmode

" use jk instead of esc
:imap jk <Esc>

" insert newline below/above without entering insert mode
map <F8> o<Esc>
map <F9> O<Esc>

" search options
set hlsearch
set incsearch
set ignorecase
set smartcase
map <CR> :nohl<cr>

" cursor
set cursorline

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
au BufRead,BufWrite *.ini :%s/\s\+$//e

" pep-8 compliance
au FileType python match ErrorMsg '\%>79v.\+'
au FileType python match ErrorMsg '\s\+$'
au BufRead,BufWrite *.py :%s/\s\+$//e

" Highlight long lines
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%120v.\+/
autocmd BufWinEnter * match OverLength /\%120v.\+/
autocmd InsertEnter * match OverLength /\%120v.\+/
autocmd InsertLeave * match OverLength /\%120v.\+/
autocmd BufWinLeave * call clearmatches()

" Ale
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_set_highlights = 1
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_enter = 0
let g:ale_open_list = 1
let g:ale_python_flake8_args = '--ignore=E131,E126,W391,E501,W503'
let g:ale_linters = { 'python': ['flake8'], 'javascript': ['eslint']}
let g:ale_warn_about_trailing_whitespace = 0
let g:ale_completion_enabled = 1
let g:ale_lint_on_text_changed = 'insert'

" Copy 
set clipboard=unnamed

" CommandT
let mapleader = ","
nnoremap <Leader>f :CommandT<cr>

" Vim-airline
let g:airline#extensions#branch#enabled = 1 " Show git branch
let g:airline#extensions#ale#enabled = 1 " ALE error status bar
let g:airline_theme = "hybrid"

" Viminfo
set viminfo='20,\"100

packloadall
silent! helptags ALL
