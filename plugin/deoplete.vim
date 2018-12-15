if (has("nvim"))
    let g:deoplete#enable_at_startup = 1
    let g:neocomplete#enable_at_startup = 0
else
    let g:deoplete#enable_at_startup = 0
    let g:neocomplete#enable_at_startup = 1
endif

" let g:deoplete#enable_at_startup = 0
" inoremap <silent><expr> <TAB>
" \ pumvisible() ? "\<C-n>" :
" \ <SID>check_back_space() ? "\<TAB>" :
" \ deoplete#mappings#manual_complete()
" function! s:check_back_space() abort "{{{
" let col = col('.') - 1
" return !col || getline('.')[col - 1]  =~ '\s'
" endfunction"}}}

" Use smartcase.
let g:neocomplete#enable_smart_case = 1
