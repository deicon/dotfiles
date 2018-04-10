" Pathogen Plugin Setup"{{{
"execute pathogen#infect()
syntax on
"..filetype plugin indent on
" Pathogen Plugin Setup
"}}}
" Preambel"{{{
let mapleader = ","
let localleader = "-"
" Quickly edit .vimrc
nnoremap <silent><leader>ev :vsplit $MYVIMRC<CR>:set foldmethod=marker<cr>:set foldlevel=0<cr>
nnoremap <leader>sv :source $MYVIMRC<CR>  

"}}}
" Global GUI Settings"{{{
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
set nocompatible
set noswapfile
set modelines=0
" Toolbar options for GVIM
set guioptions-=T " No Toolbar
set guioptions-=m " No Menubar

" put useful info in status bar
" set statusline=%F%m%r%h%w\ [%l,%c]\ %{fugitive#statusline()}\[%L,%p%%]

 " set dark background and color scheme"
 "}}}
 " Setting up My Colors"{{{1
 set background=dark
 colorscheme desert

 " highlight the status bar when in insert mode
 if version >= 700
   au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
   au InsertLeave * hi StatusLine ctermbg=240 ctermfg=12
endif

 "setup  up some custom colors"{{{2
 highlight clear SignColumn
 highlight VertSplit    ctermbg=green
 highlight VertSplit    ctermbg=green
 highlight ColorColumn  ctermbg=237
 highlight LineNr       ctermbg=grey ctermfg=black
 highlight CursorLineNr ctermbg=grey ctermfg=black
 highlight CursorLine   ctermbg=black
 highlight StatusLineNC ctermbg=green ctermfg=white
 highlight StatusLine   ctermbg=green ctermfg=white
 highlight IncSearch    ctermbg=0   ctermfg=3
 highlight Search       ctermbg=0   ctermfg=9
 highlight Visual       ctermbg=3   ctermfg=0
 highlight Pmenu        ctermbg=240 ctermfg=12
 highlight PmenuSel     ctermbg=0   ctermfg=3

"}}}
"}}}
" Disable annoying Keys like F1, Tab and stuff"{{{
 " unmap F1 help
nmap <F1> :echo "Unmapped F1 Key !"<CR>
imap <F1> <C-o>:echo "Unmapped F1 Key !"<CR>

nnoremap <tab> %
vnoremap <tab> %
" Save on lost focus
au FocusLost * :wa

inoremap jk <ESC>
"}}}
" Search Settings"{{{
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
"}}}
" Window Mangement Functions"{{{
"Splitting window vertically. Move Right
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>c <C-w><C-c>
nnoremap <leader>h <C-w>s<C-w>j
" Navigation between vertical splits
nnoremap <leader><Left> <C-w>h
noremap <leader><Down> <C-w>j
nnoremap <leader><Right> <C-w>l

" Resizing verticals
nnoremap <leader><C-Left> <C-w>5<
nnoremap <leader><C-Right> <C-w>5>
nnoremap <leader><C-Up> <C-w>5k
nnoremap <leader><C-Down> <C-w>5j
"}}}
" Code Completion Settings (General and Java)"{{{
autocmd FileType java set tags=./tags;/,tags;/
autocmd FileType java setlocal omnifunc=javacomplete2#Complete

set makeprg=mvn\ clean\ install\ -f\ ./pom.xml
set errorformat=[ERROR]\ %f:[%l\\,%v]\ %m
""}}}
