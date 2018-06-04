" vim:ts=2:sw=2:et:foldmethod=marker:foldlevel=1

" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.vimrc


" Plugins ===================================================={{{
call plug#begin('~/.config/nvim/plugged')

" Follow the pope
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-sensible'

" Automatically insert the closing symbol
Plug 'jiangmiao/auto-pairs'

" Vim Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Seamless navigation between vim windows and tmux windows
" Plug 'christoomey/vim-tmux-navigator'

" Finding files
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Git
" Plug 'jreybert/vimagit'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/gitignore'

" Close windows with <Leader>c
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }

" File navigator
Plug 'scrooloose/nerdtree' , { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }

Plug 'ryanoasis/vim-devicons'

" Dash
Plug 'rizzatti/dash.vim', { 'on': 'Dash', 'for': 'go' }

" EasyMotion
" with <Leader><Leader>s
Plug 'easymotion/vim-easymotion'

" Autoformat
Plug 'Chiel92/vim-autoformat'

" Enable autocompletion based on types
" https://github.com/Shougo/deoplete.nvim
" This requires python3
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Go
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' , 'for': 'go' }

" Deoplete autocompletion for Go
" Requires deoplete
" https://github.com/zchee/deoplete-go
" Requires https://github.com/nsf/gocode
Plug 'zchee/deoplete-go', { 'do': 'make', 'for': 'go'}

" Vue
Plug 'posva/vim-vue', { 'for': 'vue' }

" Fish
Plug 'dag/vim-fish', { 'for': 'fish' }

" Docker
Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }

" Themes
Plug 'morhetz/gruvbox'
" Plug 'altercation/vim-colors-solarized'
" Plug 'rakr/vim-one'
Plug 'ayu-theme/ayu-vim'
Plug 'chriskempson/base16-vim'
Plug 'lifepillar/vim-solarized8'
Plug 'altercation/vim-colors-solarized'
Plug 'jsantiagoh/vim-colors-plain'

call plug#end()
" }}}

" System Settings ============================================{{{
set nocompatible

filetype plugin indent on

syntax on

" put yanks/etc on the clipboard
set clipboard+=unnamed

set directory=~/tmp/vim/swaps
if exists("&undodir")
    set undodir=~/tmp/vim/undo
endif

" No backups
set nobackup
set nowritebackup

" allow vim to use hidden buffers with no warnings
set hidden

set history=1000

set relativenumber number

" Automatically update the content of the file when changed somewhere else
set autoread

" trigger autoread everytime you focus the window or enter the buffer
autocmd! FocusGained,BufEnter * checktime

" Write files automatically when calling :make or :GoBuild
set autowrite

" enable error files and error jumping
"set cf
"set sessionoptions=blank,buffers,curdir,folds,help,options,resize,winpos,winsize
"set viminfo='200,f1,r/mnt/fl,:100,/100,h

set foldlevel=4

" Don't make windows the same size when switching
set noequalalways

" Ignore some extensions
set wildignore+=*.zip,*.swp,*.pyc
set wildignore+=*/.idea/*,*.class
set wildignore+=*/venv/*

" Avoid delays when pressing the ESC key
" set ttimeout
" set ttimeoutlen=50

command! -nargs=* -complete=help Help vertical belowright help <args>
autocmd FileType help wincmd L

" This comes first, because we have mappings that depend on leader
" With a map leader it's possible to do extra key combinations
" i.e: <leader>w saves the current file
let mapleader = " "
let g:mapleader = " "

" Indentation without hard tabs
set shiftwidth=4
set softtabstop=4
set expandtab

" }}}

" Mappings ==================================================={{{
" Map the \ to act as  : 
nnoremap \ :

nnoremap <silent> <C-N> :silent noh<CR>

" Sane moving between windows  
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

nmap <leader>] :bnext<CR>
nmap <leader>[ :bprevious<CR>

" Some useful quickfix shortcuts
":cc      see the current error
":cn      next error
":cp      previous error
":clist   list all errors
map <leader>c :cn<CR>
map <leader>C :cp<CR>
" map <C-n> :cnext<CR>
" map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" Do not show stupid q: window
map q: :q

" Fast saving
nmap <leader>w :w!<cr>

nnoremap <silent> <leader>q :Sayonara<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" }}}

" Theme ======================================================{{{
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
      "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
      let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


function! BackgroundToggle()
    if  &background == "dark"
        set background=light
    elseif &background == "light"
        set background=dark
    endif
endfunction
nmap <leader>bt :call BackgroundToggle()<cr>

set background=light

" let ayucolor="mirage"  " mirage, light, dark
" colorscheme ayu
" colorscheme gruvbox
colorscheme solarized8
" colorscheme plain
" colorscheme plainsol

" }}}

" File Settings ============================================== {{{
" Remember the position of the file if available in .vimrc
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif

au BufNewFile,BufRead *.vim setlocal noet ts=4 sw=4 sts=4
au BufNewFile,BufRead *.txt setlocal noet ts=4 sw=4
au BufNewFile,BufRead *.md setlocal spell noet ts=4 sw=4
au BufNewFile,BufRead *.yml,*.yaml setlocal expandtab ts=2 sw=2
au BufNewFile,BufRead *.cpp setlocal expandtab ts=2 sw=2
au BufNewFile,BufRead *.hpp setlocal expandtab ts=2 sw=2
au BufNewFile,BufRead *.json setlocal expandtab ts=2 sw=2
au BufNewFile,BufRead *.jade setlocal expandtab ts=2 sw=2

augroup filetypedetect
  au BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
  au BufNewFile,BufRead .nginx.conf*,nginx.conf* setf nginx
  au BufNewFile,BufRead *.jade setf pug
augroup END

au FileType nginx setlocal noet ts=4 sw=4 sts=4

" scala settings
autocmd BufNewFile,BufReadPost *.scala setl shiftwidth=2 expandtab

" Markdown Settings
autocmd BufNewFile,BufReadPost *.md setl ts=4 sw=4 sts=4 expandtab

" lua settings
autocmd BufNewFile,BufRead *.lua setlocal noet ts=4 sw=4 sts=4

" Dockerfile settings
autocmd FileType dockerfile set noexpandtab

" shell/config/systemd settings
autocmd FileType fstab,systemd set noexpandtab
autocmd FileType gitconfig,sh,toml set noexpandtab

" python indent
autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=80 smarttab expandtab

" toml settings
au BufRead,BufNewFile MAINTAINERS set ft=toml

" spell check for git commits
autocmd FileType gitcommit setlocal spell

" Wildmenu completion {{{
set wildmenu
" set wildmode=list:longest
set wildmode=list:full

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=migrations                       " Django migrations
set wildignore+=go/pkg                       " Go static files
set wildignore+=go/bin                       " Go bin files
set wildignore+=go/bin-vagrant               " Go bin-vagrant files
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files
" }}}
" }}}

" Plugins Configuration ======================================{{{

" Airline ----------------------------------------------------{{{
" appear all the time
set laststatus=2

" Required for displaying the powerline characters in the console
set encoding=utf-8

" Get rid of the default mode indicator, using airline
set noshowmode

" Airline configuration https://github.com/bling/vim-airline
let g:airline#extensions#tabline#enabled = 1

" set hidden
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" let g:airline_theme='minimalist'
let g:airline_theme='solarized'

let g:airline_powerline_fonts=1

" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'

" let g:airline_left_sep=''
" let g:airline_right_sep=''

" }}}

" NERDTree ---------------------------------------------------{{{
" map <f12> :NERDTreeToggle<CR>
nmap <leader>e :NERDTreeToggle<CR>

" }}}

" Deoplete/Neocomplete ---------------------------------------{{{
if (has("nvim"))
    let g:deoplete#enable_at_startup = 1
    let g:neocomplete#enable_at_startup = 0
else
    let g:deoplete#enable_at_startup = 0
    let g:neocomplete#enable_at_startup = 1
endif

" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" }}}

" Ctrlp ------------------------------------------------------{{{
" let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
" }}}

" FZF --------------------------------------------------------{{{
nnoremap <c-p> :FZF<CR>
nnoremap <Leader>f :FZF<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>m :Marks<CR>
" }}}

" The Silver Searcher ----------------------------------------{{{
let g:ackprg = 'ag --nogroup --nocolor --column'
" }}}

" Syntastic --------------------------------------------------{{{
" let g:syntastic_javascript_checkers = ['eslint']
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" }}}

"Tagbar ------------------------------------------------------{{{
nmap <f8> :TagbarToggle<CR>
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
let g:tagbar_type_go = {
   \ 'ctagstype' : 'go',
   \ 'kinds'     : [
       \ 'p:package',
       \ 'i:imports:1',
       \ 'c:constants',
       \ 'v:variables',
       \ 't:types',
       \ 'n:interfaces',
       \ 'w:fields',
       \ 'e:embedded',
       \ 'm:methods',
       \ 'r:constructor',
       \ 'f:functions'
   \ ],
   \ 'sro' : '.',
   \ 'kind2scope' : {
       \ 't' : 'ctype',
       \ 'n' : 'ntype'
   \ },
   \ 'scope2kind' : {
       \ 'ctype' : 't',
       \ 'ntype' : 'n'
   \ },
   \ 'ctagsbin'  : 'gotags',
   \ 'ctagsargs' : '-sort -silent'
\ }
" }}}

" Markdown ---------------------------------------------------{{{
" Don't conceal
let g:markdown_syntax_conceal = 0
" }}}

" Ultisnippets -----------------------------------------------{{{
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


" }}}

" Vim-go -----------------------------------------------------{{{
"
" Go settings
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4 foldmethod=syntax relativenumber number

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

" ALE --------------------------------------------------------{{{
  let g:ale_linters = {'go': ['gometalinter' ]}
" }}}

" }}}
