syntax on

"" Define keyboard shortcut prefixes
let mapleader = ","
let localleader = "-"




" Quickly edit .vimrc {{{
nnoremap <silent><leader>ev :vsplit $HOME/.vimrc<CR>:set foldmethod=marker<cr>:set foldlevel=0<cr>
nnoremap <leader>sv :source $HOME/.vimrc<CR>  
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
"set colorcolumn=120
set listchars=
set mouse=a
set nocompatible
set noswapfile
set modelines=0
" Toolbar options for GVIM
set guioptions-=T " No Toolbar
set guioptions-=m " No Menubar
inoremap jk <ESC>
   
set background=dark
colorscheme desert

nmap <F1> :echo "Unmapped F1 Key !"<CR>
imap <F1> <C-o>:echo "Unmapped F1 Key !"<CR>

au FocusLost * :wa

" highlight the status bar when in insert mode
 if version >= 700
   au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
   au InsertLeave * hi StatusLine ctermbg=240 ctermfg=12
endif
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
"Splitting window vertically. Move Right {{{
nnoremap <leader>v <C-w>v<C-w>l
"Close last window "
nnoremap <leader>c <C-w><C-c>
nnoremap <leader>h <C-w>s<C-w>j
"avigation between vertical splits
nnoremap <leader><Left> <C-w>h
noremap <leader><Down> <C-w>j
nnoremap <leader><Right> <C-w>l

" Resizing verticals
nnoremap <leader><C-Left> <C-w>5<
nnoremap <leader><C-Right> <C-w>5>
nnoremap <leader><C-Up> <C-w>5k
nnoremap <leader><C-Down> <C-w>5j
"}}}
"PlugIns {{{
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'
" Dart and Flutter Support
Plug 'dart-lang/dart-vim-plugin'

Plug 'thosakwe/vim-flutter'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"call FlutterMenu()
" Some of these key choices were arbitrary;
" it's just an example.
nnoremap <leader>fa :FlutterRun<cr>
nnoremap <leader>fq :FlutterQuit<cr>
nnoremap <leader>fr :FlutterHotReload<cr>
nnoremap <leader>fR :FlutterHotRestart<cr>
nnoremap <leader>fD :FlutterVisualDebug<cr>


Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'ctrlpvim/ctrlp.vim'

" Initialize plugin system
call plug#end()
"}}}


" LSC Code Navigation Setup {{{

let g:lsc_server_commands = {'dart': 'dart_language_server'}


" Use all the defaults (recommended):
"let g:lsc_auto_map = v:true

" Apply the defaults with a few overrides:
"let g:lsc_auto_map = {'defaults': v:true, 'FindReferences': '<leader>r'}

" Setting a value to a blank string leaves that command unmapped:
"let g:lsc_auto_map = {'defaults': v:true, 'FindImplementations': ''}


let g:lsc_auto_map = {
    \ 'GoToDefinition': '<C-b>',
    \ 'GoToDefinitionSplit': ['<C-B>]', '<C-W><C-]>'],
    \ 'FindReferences': 'gr',
    \ 'FindImplementations': 'gI',
    \ 'FindCodeActions': 'ga',
    \ 'Rename': 'gR',
    \ 'ShowHover': v:true,
    \ 'DocumentSymbol': 'go',
    \ 'WorkspaceSymbol': 'gS',
    \ 'SignatureHelp': 'gm',
    \ 'Completion': 'completefunc',
    \}

"    \ 'PreviousReference': '<C-p>',

" Next Ruffer
map <leader>z :bn<cr>
" Prev Buffer
map <leader>x :bp<cr>
" Delete Ruffer 
map <leader>d :bd<cr>
" List of all uffers
map <leader>e :CtrlPMixed<cr>



" }}}

" Flutter comands {{{
nnoremap <F4> :!flutter emulators --launch apple_ios_simulator<cr><esc>
nnoremap <F5> :!flutter run<cr>

nnoremap <leader>f ]m
nnoremap <leader>F [m

"}}} 

" NERTree Commands {{{
nnoremap <C-n> :NERDTreeToggle<cr>
" }}}

" Coc Snippets {{{
"

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
"
" " Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
"
" " Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
"
" " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
"
" " Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

noremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
" }}}

:autocmd BufWritePost *.dart :DartFmt
nnoremap <leader>ll :DartFmt<cr>  

" Enable the list of buffers
let g:airline#extensions#tabline#enabled=1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
map <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg|zip|mp4)$',
\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

nnoremap <leader>lt :NERDTreeFind<cr>

source ~/.cocflutterrc
