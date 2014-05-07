set nocompatible
set number
execute pathogen#infect()
syntax on
filetype on
filetype plugin on 
filetype indent on
set guifont=Source\ Code\ Pro\ Light:h14
set wildmenu
set lazyredraw
set showmatch
set showcmd
set colorcolumn=80
set laststatus=2
set autoindent
setlocal shiftwidth=2
setlocal tabstop=2
set expandtab
:set hlsearch
au FileType ruby setl sw=2 sts=2 et
au FileType yaml setl sw=2 sts=2 et
