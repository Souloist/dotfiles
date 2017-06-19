" pathogen
execute pathogen#infect()
syntax enable
filetype plugin indent on

" color scheme
set t_Co=256
set background=dark

" backupcopy
set backupcopy=yes

" UTF8 Support
set encoding=utf-8

" tab settings
set shiftwidth=4 softtabstop=4 expandtab tabstop=8 smarttab
syntax on

" Set fold off at start
set foldlevelstart=10

" indentation settings
set ai "Auto indent
set si "Smart indent
set nu

" status line
set laststatus=2                        " status line always visible
set noshowmode

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
au BufRead,BufWrite *.ini :%s/\s\+$//e

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
     
" Copy 
set clipboard=unnamed

" NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
let mapleader = ","
nnoremap <Leader>f :NERDTreeToggle<cr>

" Vim-airline
let g:airline#extensions#branch#use_vcscommand = 1 " show mercurial branch

" Viminfo
set viminfo='20,\"100

" Python-mode
let g:pymode_options_colorcolumn = 0
let g:pymode_lint = 0
let g:pymode_rope = 0
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_autoimport = 0

" Enhanced python highlighting
hi pythonLambdaExpr      ctermfg=105 guifg=#8787ff
hi pythonInclude         ctermfg=68  guifg=#5f87d7 cterm=bold gui=bold
hi pythonClass           ctermfg=167 guifg=#FF62B0 cterm=bold gui=bold
hi pythonParameters      ctermfg=147 guifg=#AAAAFF
hi pythonParam           ctermfg=175 guifg=#E37795
hi pythonBrackets        ctermfg=183 guifg=#d7afff
hi pythonClassParameters ctermfg=111 guifg=#FF5353
hi pythonSelf            ctermfg=68  guifg=#5f87d7 cterm=bold gui=bold

hi pythonDottedName      ctermfg=74  guifg=#5fafd7

hi pythonError           ctermfg=196 guifg=#ff0000
hi pythonIndentError     ctermfg=197 guifg=#ff005f
hi pythonSpaceError      ctermfg=198 guifg=#ff0087

hi pythonBuiltinType     ctermfg=74  guifg=#9191FF
hi pythonBuiltinObj      ctermfg=71  guifg=#5faf5f
hi pythonBuiltinFunc     ctermfg=169 guifg=#d75faf cterm=bold gui=bold

hi pythonException       ctermfg=207 guifg=#CC3366 cterm=bold gui=bold
