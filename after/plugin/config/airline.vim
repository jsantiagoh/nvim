if !exists(':AirlineToggle')
	finish
endif

let g:airline_extensions = [
      \ 'branch',
      \ 'ale',
      \ 'fugitiveline',
      \ 'netrw',
      \ 'quickfix',
      \ 'tabline',
      \ 'tmuxline' ]
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9