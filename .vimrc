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

" get R help in the R window
let R_open_example = 0
let R_nvimpager = "no"

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
