set nocompatible
set number
execute pathogen#infect()
syntax on
set background=dark
filetype on
filetype plugin on
filetype indent on
"set guifont=Fira\ Code\ Regular:h14
set wildmenu
set lazyredraw
set showmatch
set showcmd
set noswapfile
set colorcolumn=80,81,82,83,84,85
hi ColorColumn ctermbg=DarkGrey ctermfg=White
set laststatus=2
set autoindent
setlocal shiftwidth=2
setlocal tabstop=2
set expandtab
set hlsearch
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
highlight Search ctermbg=red ctermfg=lightblue
au FileType ruby setl sw=2 sts=2 et
au FileType yaml setl sw=2 sts=2 et
au FileType javascript setl sw=2 sts=2 et
au FileType json setl sw=4 sts=4 et
au FileType python setl sw=4 sts=4 et
au FileType go setl sw=4 sts=4 et
hi Visual term=reverse cterm=reverse ctermbg=None
hi Title ctermfg=Black ctermbg=LightGrey
hi SpellBad ctermfg=lightblue ctermbg=red
hi SpellCap ctermfg=lightblue ctermbg=red
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
:imap jk <Esc>
" Ugh http://vim.wikia.com/wiki/Backspace_and_delete_problems
func Backspace()
  if col('.') == 1
    if line('.')  != 1
      return  "\<ESC>kA\<Del>"
    else
      return ""
    endif
  else
    return "\<Left>\<Del>"
  endif
endfunc
inoremap <BS> <c-r>=Backspace()<CR>
