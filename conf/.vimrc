
set number   " Show line numbers
set ruler    " Show current line and column
set hlsearch " Highlight searched patterns

" Insert white space always
set tabstop=4 shiftwidth=4 expandtab

" Color column 81, use black, column's index start with 1
set colorcolumn=81 
highlight ColorColumn ctermbg=black 

" Turn off matching parenthesis highlighting
" http://design.liberta.co.za/articles/customizing-disabling-vim-matching-parenthesis-highlighting/
let g:loaded_matchparen=1 

" Restore cursor position (and autocmd)
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" Switch to the next tab by pressing <F2>
map <F2> :tabn

