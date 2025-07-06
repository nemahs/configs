" Basic config {{{
colorscheme torte
filetype indent on
filetype on
let indentwidth=2
set background=dark
set backspace=indent
set cindent
set cinoptions="g0,N-s" " check :help cinoptions-values for more options
set cursorline
set expandtab
set encoding=utf-8
set foldnestmax=3
set foldclose=all
set foldcolumn=2
set incsearch
set ignorecase smartcase
set nohlsearch
set number relativenumber
let &shiftwidth=indentwidth
set shiftround
set scrolloff=1
let &tabstop=indentwidth
set title
set wildmenu
set wildmode=list:longest
set wildignore+=.pyc,.swp
syntax on
let mapleader=';'
let localleader='\\'
" }}}

" Spelling fixes {{{
iabbrev teh the
cabbrev W w
cabbrev WQ wq

" }}}

" Remaps {{{
inoremap jj <Esc>
inoremap <C-Enter> <C-x><C-]>
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
augroup FoldMethods
  autocmd! FileType * setlocal foldmethod=marker
  autocmd  FileType vim setlocal foldmethod=marker
  autocmd  FileType cpp,h,c setlocal foldmethod=syntax
augroup END

augroup Comments
  autocmd! FileType javascript,cpp,c nnoremap <buffer> <localleader>c I//<ESC>
  autocmd  Filetype python nnoremap <buffer> <localleader>c I#<ESC>
augroup END

augroup HeaderSetup
  autocmd! BufNewFile *.h call GenerateIncludeGuard(expand("<afile>"))
augroup END

augroup CPPOptions
  autocmd! FileType c,cpp,h, setlocal colorcolumn=140
augroup END

" }}}

" Ctags {{{
if executable('ctags')
  set tags="./tags,tags;~"
  nnoremap <leader>h :call SwitchHeader()

  function! SwitchHeader()
    " TODO: Copy from the high side vimrc

  endfunction
endif
" }}}
