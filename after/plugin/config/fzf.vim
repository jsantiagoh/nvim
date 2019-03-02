if !exists(':FZF')
	finish
endif

nnoremap <c-p> :GFiles<CR>
nnoremap <Leader>f :FZF<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>m :Marks<CR>

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
