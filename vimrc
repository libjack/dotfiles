runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

"" a good start
set nocompatible          " get rid of Vi compatibility mode. SET FIRST!
filetype plugin indent on " filetype detection[ON] plugin[ON] indent[ON]
set t_Co=256              " enable 256-color mode.
syntax enable             " enable syntax highlighting (previously syntax on).

" colors, etc
colorscheme desert        " set colorscheme

" tab settings
set tabstop=4             " tab spacing
set softtabstop=2         " unify
set shiftwidth=2          " indent/outdent by 2 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
"set smarttab              " use tabs at the start of a line, spaces elsewhere

" other common settings
set encoding=utf-8
set scrolloff=3
set autoindent            " auto-indent
"set number                " show line numbers
set laststatus=2          " last window always has a statusline
set ruler                 " Always show info along bottom.
"set nowrap                " don't wrap text
set ttyfast
set backspace=indent,eol,start
"set relativenumber
"set undofile
set mouse=a               " I use file tabs, so having mouse work is nice
set wildmenu
set wildmode=list:longest

" searching things
"set nohlsearch            " Don't continue to highlight searched phrases.
set hlsearch 
set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
set smartcase             " UPPER only matches UPPER
set gdefault              " global on search by default
" a way to turn off search matching
nmap <leader><space> :nohlsearch<cr>
nnoremap <tab> %
vnoremap <tab> %

" line wrapping
set wrap
set textwidth=79
set formatoptions=qrn1
"set colorcolumn=85

" movement by file line!
nnoremap j gj
nnoremap k gk

" grep/lgrep fun
nnoremap <left>  :cprev<cr>zvzz
nnoremap <right> :cnext<cr>zvzz
nnoremap <up>    :lprev<cr>zvzz
nnoremap <down>  :lnext<cr>zvzz


nmap <leader>l :setlocal number!<cr>
nmap <leader>rl :setlocal relativenumber!<cr>
nmap <leader>o :set paste!


nmap <leader>e :NERDTreeToggle
nmap <leader>m :set mouse=a<cr>
nmap <leader>M :set mouse=<cr>

nmap <leader>s :syntax off
nmap <leader>S :syntax on

" turn on nice tab markers
let g:airline#extensions#tabline#enabled = 1
" CtrlP mode
" just the working directory
let g:ctrlp_working_path_mode = 'c'

" some list chars things
" " still need to turn of list :set list!
set listchars=tab:>-,trail:.
