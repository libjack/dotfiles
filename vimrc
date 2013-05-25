runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

"" a good start
set nocompatible          " get rid of Vi compatibility mode. SET FIRST!
filetype plugin indent on " filetype detection[ON] plugin[ON] indent[ON]
set t_Co=256              " enable 256-color mode.
syntax enable             " enable syntax highlighting (previously syntax on).
colorscheme desert        " set colorscheme
"set number                " show line numbers
set laststatus=2          " last window always has a statusline
filetype indent on        " activates indenting for files
"set nohlsearch            " Don't continue to highlight searched phrases.
set hlsearch 
set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
set smartcase             " UPPER only matches UPPER
set ruler                 " Always show info along bottom.
set autoindent            " auto-indent
set tabstop=4             " tab spacing
set softtabstop=2         " unify
set shiftwidth=2          " indent/outdent by 2 columns
"set expandtab            " hitting tab in insert mode will produce the
                          "      appropiate number of spaces
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set smarttab              " use tabs at the start of a line, spaces elsewhere
set nowrap                " don't wrap text

set ai
set mouse=a
set wildmenu

nmap <leader>l :setlocal number!
nmap <leader>o :set paste!

" a way to turn off search matching
nmap <leader>q :nohlsearch

nmap <leader>e :NERDTreeToggle
nmap <leader>m :set mouse=a
nmap <leader>M :set mouse=

" VimClojure
let g:vimclojure#HighlightBuiltins = 1
let g:vimclojure#ParenRainbow = 1
"let g:vimclojure#WantNailgun = 1

