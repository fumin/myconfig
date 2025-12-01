" Load defaults.
runtime defaults.vim
source $VIMRUNTIME/defaults.vim

" Disable mouse clicks for changing cursor position.
set mouse-=a

" Disable autoindentation in .html files.
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal indentexpr=
autocmd FileType html setlocal noautoindent
