" Don't warn me about an outdated version of vim/nvim
let g:go_version_warning = 0

" Go settings
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']

" let g:go_fmt_fail_silently = 0
let g:go_fmt_command = "goimports"
" let g:go_autodetect_gopath = 1
" let g:go_term_enabled = 1
" let g:go_snippet_engine = "neosnippet"
" let g:go_highlight_space_tab_error = 0
" let g:go_highlight_array_whitespace_error = 0
" let g:go_highlight_trailing_whitespace_error = 0
" let g:go_highlight_extra_types = 0
" let g:go_highlight_operators = 0
" let g:go_highlight_build_constraints = 1

au FileType go nmap <Leader>s <Plug>(go-def-split)
au FileType go nmap <Leader>v <Plug>(go-def-vertical)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>l <Plug>(go-metalinter)
" au FileType go nmap <leader>r  <Plug>(go-run)
" au FileType go nmap <leader>b  <Plug>(go-build)
au FileType go nmap <leader>t  <Plug>(go-test)
" au FileType go nmap <leader>dt  <Plug>(go-test-compile)
au FileType go nmap <Leader>d <Plug>(go-doc)
au FileType go nmap <Leader>r <Plug>(go-rename)
" au FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

" run :GoBuild or :GoTestCompile based on the go file
" function! s:build_go_files()
"   let l:file = expand('%')
"   if l:file =~# '^\f\+_test\.go$'
"     call go#test#Test(0, 1)
"   elseif l:file =~# '^\f\+\.go$'
"     call go#cmd#Build(0)
"   endif
" endfunction
" au FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

" neovim specific
" if has('nvim')
"   au FileType go nmap <leader>rt <Plug>(go-run-tab)
"   au FileType go nmap <Leader>rs <Plug>(go-run-split)
"   au FileType go nmap <Leader>rv <Plug>(go-run-vertical)
" endif

augroup go
    autocmd!
    autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
    autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
    autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
augroup END
" }}}

