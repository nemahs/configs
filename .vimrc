" Basic config {{{
colorscheme torte
filetype indent on
filetype on
set cindent
set cinoptions="g0,N-s" " check :help cindent for more options
set expandtab
set nohlsearch
set number
set shiftwidth=2
set tabstop=2
set wildmenu
set wildmode=list:longest
syntax on
let mapleader=';'
let localleader='\\'
" }}}

" Spelling fixes {{{
iabbrev teh the

" }}}

"Remaps {{{ 
inoremap jj <Esc>
nnoremap <leader>ev :edit ~/.vimrc<CR>
nnoremap <leader>sv :source ~/.vimrc<CR>
nnoremap <S-k> dd2kp
nnoremap <S-j> ddp
nnoremap nl o<ESC>
nnoremap <Space> i_<Esc>r
" }}}

" Functions {{{
function! GenerateIncludeGuard(file_name)
  const guardName = toupper(join(split(a:file_name, '\.'), '_'))

  execute "normal! a#ifndef " . guardName . "\<cr>"
      \ . "#define " . guardName . "\<cr>"
      \ . "#endif" . "\<Esc>"

  normal! 2O
endfunction
" }}}

" Auto Commands {{{
autocmd! FileType vim setlocal foldmethod=marker

augroup Comments
  autocmd! FileType javascript,cpp,c nnoremap <buffer> <localleader>c I//<ESC>
  autocmd  Filetype python nnoremap <buffer> <localleader>c I#<ESC>
augroup END

augroup HeaderSetup
  autocmd! BufNewFile *.h call GenerateIncludeGuard(expand("<afile>"))
augroup END

" }}}

