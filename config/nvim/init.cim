let mapleader=","
let localleader="-"
" Quickly edit .rc {{{
nnoremap <silent><leader>ev :vsplit $HOME/.config/nvim/init.cim<CR>:set foldmethod=marker<cr>:set foldlevel=0<cr>
nnoremap <leader>sv :source $HOME/.config/nvim/init.cim<CR>  
nnoremap <silent><leader>el :vsplit $HOME/.config/nvim/init.lua<CR>:set foldmethod=marker<cr>:set foldlevel=0<cr>
"}}}

" Text display Setup {{{
:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
" }}}

" Global GUI Settings"{{{

inoremap jk <ESC>
  
set background=dark
colorscheme desert

nmap <F1> :echo "Unmapped F1 Key !"<CR>
imap <F1> <C-o>:echo "Unmapped F1 Key !"<CR>

au FocusLost * :wa

" }}}

" NETRW Settings {{{
 let g:netrw_banner=1
 let g:netrw_liststyle=0
 let g:netrw_browse_split=4 " reuse last window

" }}}
" Plugins {{{
call plug#begin()

Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/dart-lang/dart-vim-plugin' " 
Plug 'https://github.com/neovim/nvim-lspconfig'
Plug 'https://github.com/kien/ctrlp.vim'
Plug 'https://github.com/fatih/vim-go', { 'do': ':GoUpdateBinaries' } 
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
" Completion setup
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' } 
Plug 'https://github.com/majutsushi/tagbar' " Tag in sidebar
Plug 'https://github.com/majutsushi/tagbar' " Tag in sidebar
Plug 'nvim-telescope/telescope-github.nvim'

" Debugging
Plug 'https://github.com/mfussenegger/nvim-dap'
Plug 'https://github.com/rcarriga/nvim-dap-ui'
Plug 'https://github.com/leoluz/nvim-dap-go'
Plug 'https://github.com/theHamsta/nvim-dap-virtual-text'
Plug 'https://github.com/nvim-telescope/telescope-dap.nvim'

" Kotlin
Plug 'udalov/kotlin-vim'

 " Motions
 Plug 'phaazon/hop.nvim'
set encoding=UTF-8

call plug#end()
" }}} zo

" Nerdtree Setup {{{
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
" }}}


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
"Splitting window vertically. Move Right {{{
nnoremap <leader>v <C-w>v<C-w>l
"Close last window "
nnoremap <leader>c <C-w><C-c>
nnoremap <leader>h <C-w>s<C-w>j
"avigation between vertical splits
nnoremap <leader><Left> <C-w>h
noremap <leader><Down> <C-w>j
nnoremap <leader><Right> <C-w>l
nnoremap <leader><Up> <C-w>k

" Resizing verticals
nnoremap <leader><C-Left> <C-w>5<
nnoremap <leader><C-Right> <C-w>5>
nnoremap <leader><C-Up> <C-w>5k
nnoremap <leader><C-Down> <C-w>5j
"}}}
nmap <F8> :TagbarToggle<CR>

":set completeopt-=preview " For No Previews

:colorscheme jellybeans

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"


" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


lua require('dieter')

