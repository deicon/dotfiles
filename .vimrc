
execute pathogen#infect()
syntax on
filetype plugin indent on

set nocompatible

set modelines=0

let mapleader = ","
" Quickly edit .vimrc
nnoremap <leader>ev :split $MYVIMRC<CR>  
nnoremap <leader>sv :source $MYVIMRC<CR>     

" Standards
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=120
set listchars=
set mouse=a

" put useful info in status bar
 set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [%l,%c]\ [%L,%p%%]

 " set dark background and color scheme
 set background=dark
 colorscheme desert

 " highlight the status bar when in insert mode
 if version >= 700
   au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
   au InsertLeave * hi StatusLine ctermbg=240 ctermfg=12
endif

 "setup  up some custom colors
 highlight clear SignColumn
 highlight VertSplit    ctermbg=236
 highlight ColorColumn  ctermbg=237
 highlight LineNr       ctermbg=236 ctermfg=240
 highlight CursorLineNr ctermbg=236 ctermfg=240
 highlight CursorLine   ctermbg=236
 highlight StatusLineNC ctermbg=238 ctermfg=0
 highlight StatusLine   ctermbg=240 ctermfg=12
 highlight IncSearch    ctermbg=0   ctermfg=3
 highlight Search       ctermbg=0   ctermfg=9
 highlight Visual       ctermbg=3   ctermfg=0
 highlight Pmenu        ctermbg=240 ctermfg=12
 highlight PmenuSel     ctermbg=0   ctermfg=3

" Adding some useful remaps
 " unmap F1 help
nmap <F1> :echo<CR>
imap <F1> <C-o>:echo<CR>


nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %
inoremap jk <ESC>
" Vertical Splitting Windows
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>c <C-w><C-c>
" Navigation between vertical splits
nnoremap <C-h> <C-w>h
nnoremap <leader><Left> <C-w>h
noremap <C-j> <C-w>j
noremap <leader><Down> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader><Right> <C-w>l


" Save on lost focus
au FocusLost * :wa

" CtrlP Settings
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/*.jar,*.class     " Linux/MacOSX
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" NERDTree settings
map <C-n> :NERDTreeToggle<CR>
