" Basic config {{{
set number
set expandtab
set nohlsearch
set tabstop=2
set shiftwidth=2
set wildmenu
set wildmode=list:longest
colorscheme torte
filetype on
filetype indent on
let mapleader=';'
let localleader='\\'
" }}}

" Spelling fixes {{{

" }}}

"Remaps {{{ 
inoremap jj <Esc>
nnoremap <leader>ev :edit ~/.vimrc<CR>
nnoremap <leader>sv :source ~/.vimrc<CR>
nnoremap nl O<ESC>
nnoremap <Space> i_<Esc>r
" }}}

" Functions {{{
function! GenerateIncludeGuard(file_name)
  let guardName = toupper(join(split(a:file_name, '\.'), '_'))
  echom guardName

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

