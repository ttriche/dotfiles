" ag 
let g:ackprg = 'ag --nogroup --nocolor --column'

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

" type __ to get <- 
let R_assign=2

" default R start options
let R_args = ['--no-save', '--quiet']
let R_clear_line = 1

" get R help in the R window
let R_open_example = 0
let R_nvimpager = "no"
let R_in_buffer = 0

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

" lintr
let ale_r_lintr_options="lintr::with_defaults(object_name_linter=NULL, trailing_blank_lines_linter=NULL, trailing_whitespace_linter=NULL, infix_spaces_linter=NULL"

" styler
" let ale_r_styler_options="styler::bioc_style"

" Put these lines at the very end of your vimrc file.

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall

" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
