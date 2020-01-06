if !exists(':Clap')
	finish
endif

nnoremap <c-p> :Clap files<CR>
nnoremap <Leader>f :Clap files<CR>
nnoremap <Leader>b :Clap buffers<CR>
