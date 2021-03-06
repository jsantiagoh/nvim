" :vim:ts=2:sw=2:et:foldmethod=marker:foldlevel=1
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

" set relativenumber number

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


" Map semicolon to colon
nnoremap ; :
" nnoremap : ;
" vnoremap ; :
" vnoremap : ;

inoremap kj <Esc>

" Indentation without hard tabs
set shiftwidth=4
set softtabstop=4
set expandtab

" Live substitutions
if has('nvim')
    set inccommand=split
endif

" Don't fold by default
set foldlevel=11

" Use a specific virtualenv for nvim
" :h provider-python
" pyenv install 3.6.6
" pyenv virtualenv 3.6.6 py3nvim
" pyenv activate py3nvim
" pip install pynvim
" pyenv which python  # Note the path
" pip install -r requirements.txt
if has('nvim')
    " let g:python_host_prog = $HOME . '/.pyenv/versions/pynvim/bin/python'
    let g:python3_host_prog = $HOME . '/.pyenv/versions/py3nvim/bin/python'
endif

" Show statusline all the time
set laststatus=2

" Required for displaying the powerline characters in the console
set encoding=utf-8

" }}}

" Mappings ==================================================={{{
" Map the \ to act as  :
nnoremap \ :

nnoremap <silent> <c-n> :silent noh<CR>

" Sane moving between windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" nmap <leader>] :bnext<CR>
" nmap <leader>[ :bprevious<CR>

nnoremap <tab> :bnext<CR>
nnoremap <s-tab> :bprevious<CR>


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

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Toggle between light and dark themes
nmap <leader>bt <Plug>BackgroundToggle

if has("termguicolors")
    set termguicolors
endif

" set background=dark

" Force Italics
" highlight Comment cterm=italic

let g:gruvbox_italic=1
let g:deus_italic=1
let g:nord_italic=1
let ayucolor="light"  " mirage, light, dark

" colorscheme gruvbox
" colorscheme ayu
" colorscheme plain
" colorscheme plainsol
" colorscheme deus

" Theme configuration that includes:
" - colorscheme for light and dark
" - airline theme for light and dark
let g:theme_config = {
            \ "light": {
            \ "colorscheme" : "ayu",
            \ "airline_theme": "ayu"
            \},
            \ "dark" : {
            \ "colorscheme" : "ayu",
            \ "airline_theme": "ayu_mirage"
            \},
            \}


call theme#settheme("light")

" let g:lightline = {
"       \ 'colorscheme': 'gruvbox',
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ],
"       \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
"       \ },
"       \ 'component_function': {
"       \   'gitbranch': 'fugitive#head'
"       \ },
"       \ }

" Remember the position of the file if available in .vimrc
autocmd BufReadPost *
            \ if line("'\"") > 1 && line("'\"") <= line("$") |
            \   execute "normal! g`\"" |
            \ endif

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
set wildignore+=go/pkg                           " Go static files
set wildignore+=go/bin                           " Go bin files
set wildignore+=go/bin-vagrant                   " Go bin-vagrant files
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files

function! PackInit() abort
	packadd minpac

	call minpac#init()

	" Follow the pope
	call minpac#add('tpope/vim-commentary')
	call minpac#add('tpope/vim-unimpaired')
	call minpac#add('tpope/vim-surround')
	call minpac#add('tpope/vim-repeat')


	" Language pack
	call minpac#add('sheerun/vim-polyglot')

	" Continuously updated session files
	" call minpac#add('tpope/vim-obsession')

	" Automatically insert the closing symbol
	call minpac#add('jiangmiao/auto-pairs')


	" Indentation lines
	" call minpac#add('Yggdroot/indentLine')

	" FZF
	" call minpac#add('junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' })
	" call minpac#add('junegunn/fzf.vim')

	" vim-clap
	call minpac#add('liuchengxu/vim-clap')

	" Git
	call minpac#add('tpope/vim-fugitive')
	call minpac#add('airblade/vim-gitgutter')
	call minpac#add('vim-scripts/gitignore')

	" Close windows with <Leader>c
	call minpac#add('mhinz/vim-sayonara', { 'on': 'Sayonara' })

	" NERD Tree
	call minpac#add('scrooloose/nerdtree' , { 'on': 'NERDTreeToggle' })
	call minpac#add('Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' })

	" Add nice icons
	" call minpac#add('ryanoasis/vim-devicons')

	" Dash
	" call minpac#add('rizzatti/dash.vim', { 'on': 'Dash', 'for': 'go' })

	" EasyMotion
	" with <Leader><Leader>s
	" call minpac#add('easymotion/vim-easymotion')

	" Autoformat
	" call minpac#add('Chiel92/vim-autoformat')


	" Snippets
	" call minpac#add('SirVer/ultisnips')
	" call minpac#add('honza/vim-snippets')

	call minpac#add('junegunn/vim-easy-align')

	call minpac#add('mustache/vim-mustache-handlebars')

	" Tags
	" call minpac#add('ludovicchabant/vim-gutentags')
	" call minpac#add('majutsushi/tagbar')
	call minpac#add('liuchengxu/vista.vim')

	" Editorconfig
	" call minpac#add('editorconfig-vim')

	" Tmux navigation
	call minpac#add('christoomey/vim-tmux-navigator')
	" call minpac#add('edkolev/tmuxline.vim')

	" Statusline
	call minpac#add('vim-airline/vim-airline')
	call minpac#add('vim-airline/vim-airline-themes')
	" call minpac#add('itchyny/lightline.vim')

	" Tabline
	" call minpac#add('mkitt/tabline.vim')

	" Languages & Syntax
	" ------------------
	" LSP
	call minpac#add('neoclide/coc.nvim', { 'branch': 'release' })

	" ALE
	" call minpac#add('w0rp/ale')
	" call minpac#add('autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh'})

	" Enable autocompletion based on types
	" https://github.com/Shougo/deoplete.nvim
	" This requires python3
	" call minpac#add('Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' })

	" Vue
	" call minpac#add('posva/vim-vue', { 'for': 'vue' })

	" Fish
	" call minpac#add('dag/vim-fish', { 'for': 'fish' })

	" Docker
	" call minpac#add('ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' })

	" Terraform
	" call minpac#add('hashivim/vim-terraform')

	" Python
	" call minpac#add('zchee/deoplete-jedi')
	" call minpac#add('davidhalter/jedi-vim')
	" call minpac#add('ambv/black')

	" Go
	" call minpac#add('fatih/vim-go', { 'do': 'GoInstallBinaries' , 'for': 'go' })
	" Deoplete autocompletion for Go
	" Requires deoplete
	" https://github.com/zchee/deoplete-go
	" Requires https://github.com/nsf/gocode
	" call minpac#add('zchee/deoplete-go', { 'do': 'make', 'for': 'go'})

	" Themes
	" ------
	call minpac#add('morhetz/gruvbox')
	call minpac#add('ayu-theme/ayu-vim')
	call minpac#add('chriskempson/base16-vim')
	call minpac#add('lifepillar/vim-solarized8')
	call minpac#add('arcticicestudio/nord-vim')
	" call minpac#add('altercation/vim-colors-solarized')
	" call minpac#add('jsantiagoh/vim-colors-plain')
	call minpac#add('jnurmine/Zenburn')
	call minpac#add('jacoborus/tender.vim')
	call minpac#add('ajmwagar/vim-deus')
endfunction

" Define user commands for updating/cleaning the plugins.
" Each of them calls PackInit() to load minpac and register
" the information of plugins, then performs the task.
command! PackUpdate call PackInit() | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus call PackInit() | call minpac#status()
