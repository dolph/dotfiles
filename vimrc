" change the leader to be a comma vs slash
let mapleader=","

" syntax highlighting
syntax on

" display line numbers
set number

" using only 1 column (and 1 space) while possible
set numberwidth=1

" we are using dark background in vim
set background=dark

" ignore these files when completing
set wildignore+=.git,*.pyc

" show a line at column 79
if exists("&colorcolumn")
    set colorcolumn=79
endif

" have a line indicate the cursor location
set cursorline

" show the cursor position all the time
set ruler

" use spaces, not tabs, for autoindent/tab key.
set expandtab

" don't wrap text
set nowrap

" don't wrap text in the middle of a word
set linebreak

" always set auto-indenting on
set autoindent

" use smart indent if there is no indent file
set smartindent

" <tab> inserts 4 spaces
set tabstop=4

" but an indent level is 4 spaces wide.
set shiftwidth=4

" <BS> over an autoindent deletes both spaces.
set softtabstop=4

" rounds indent to a multiple of shiftwidth
set shiftround

" show matching <> (html mainly) as well
set matchpairs+=<:>

" disable folding
set nofoldenable

" don't bell or blink
set noerrorbells
set vb t_vb=

" keep our cursor in the middle of the screen
set scrolloff=100
set sidescrolloff=30

" show whitespace
set list
set listchars=tab:>-,trail:~

" default to using case insensitive searches ...
set ignorecase

" ... unless uppercase letters are used in the regex.
set smartcase

" handle tabs more intelligently while searching
set smarttab

" highlight searches by default.
set hlsearch

" incrementally search while typing a /regex
set incsearch

" remove trailing whitespace on <leader>S
noremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" load Vundle for plugin management
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage itself
Plugin 'gmarik/Vundle.vim'

" plugins
" after adding a new plugin, run "vim +PluginInstall +qall" to install it
Plugin 'dolph/vim-colors-solarized-black'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'ervandew/supertab'
Plugin 'mileszs/ack.vim'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'

Plugin 'godlygeek/tabular' " must appear before plasticboy/vim-markdown
Plugin 'plasticboy/vim-markdown'

" end loading plugins
call vundle#end()
filetype plugin indent on

" set color theme
colorscheme solarized

" set shortcut key and open NerdTree at start
map <leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '\.egg-info$', '\.db$']

" run flake8 on save
autocmd BufWritePost *.py call Flake8()

" cut, copy & paste
nmap <C-V> "+gP
imap <C-V> <ESC>"+gpi
vmap <C-V> c<ESC>"+gph
vmap <C-C> "+y

" enable spell checking
set spell spelllang=en_us

" disable double spacing between sentences
set nojoinspaces

" integrate yanking & pasting with the OS X clipboard
set clipboard=unnamed
