" Get rid of the default mode indicator, using airline
set noshowmode

let g:airline_extensions = [
      \ 'branch',
      \ 'ale',
      \ 'fugitiveline',
      \ 'gutentags',
      \ 'netrw',
      \ 'quickfix',
      \ 'tabline',
      \ 'tmuxline' ]

let g:airline_powerline_fonts=1

" Airline configuration https://github.com/bling/vim-airline
let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1

let g:airline_mode_map = {
            \ '__' : '-',
            \ 'c'  : 'C',
            \ 'i'  : 'I',
            \ 'ic' : 'I',
            \ 'ix' : 'I',
            \ 'n'  : 'N',
            \ 'ni' : 'N',
            \ 'no' : 'N',
            \ 'R'  : 'R',
            \ 'Rv' : 'R',
            \ 's'  : 'S',
            \ 'S'  : 'S',
            \ '' : 'S',
            \ 't'  : 'T',
            \ 'v'  : 'V',
            \ 'V'  : 'V',
            \ '' : 'V',
            \ }

" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline_left_sep=''
" let g:airline_right_sep=''
