" pathogen
execute pathogen#infect()

" ag 
let g:ackprg = 'ag --nogroup --nocolor --column'

" lintr
let g:syntastic_enable_r_lintr_checker = 1
let g:syntastic_r_checkers = 1
let g:syntastic_r_lintr_linters = "with_defaults(absolute_paths_linter=NULL, object_usage_linter=NULL, camel_case_linter=NULL, snake_case_linter=NULL, trailing_whitespace_linter=NULL, object_length_linter=NULL, open_curly_linter=NULL, commas_linter=NULL, multiple_dots_linter=NULL, trailing_blank_lines_linter=NULL, spaces_left_parentheses_linter=NULL, line_length_linter=NULL)"

" Tim's .vimrc (with special magic powers)
set bg=dark
set splitbelow
set nocompatible

syntax enable
filetype plugin on
filetype indent on

" toggle autoindent on paste
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O><F2>
set pastetoggle=<F2>

" send selections/lines to R
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine

" {{{ Formatting options
set cino=>2
set autowrite
set backspace=indent,eol,start
set noerrorbells
set fileformat=unix
set nojoinspaces
set lazyredraw
set tabstop=2
set expandtab
set showmatch
set nocompatible
set shiftwidth=2
set nosmarttab
set smartcase
set lazyredraw
set hlsearch
" set number
" }}} formatting options 
"  Fold settings "{{{
set foldenable
set foldmethod=marker
"}}}

let showmarks_enable=0
let vimrplugin_tmux=1
let vimrplugin_vimpager=1
let vimrplugin_underscore=0
let vimrplugin_specialplot=1
let vimrplugin_listmethods=1
let vimrplugin_r_args="--no-save --quiet"
let vimrplugin_screenplugin=0
let vimrplugin_screenvsplit="no"
