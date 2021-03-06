
let mapleader = "\<Space>"

" =============================================================================
" # PLUGINS
" =============================================================================
" Load vundle
set nocompatible
filetype off
set rtp+=~/dev/others/base16/templates/vim/

let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-d>'
let g:VM_maps['Find Subword Under'] = '<C-d>'
let g:VM_maps["Select Cursor Down"] = '<C-S-Down>'
let g:VM_maps["Select Cursor Up"]   = '<C-S-Up>'

call plug#begin()

Plug 'editorconfig/editorconfig-vim'
Plug 'preservim/nerdtree'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'arcticicestudio/nord-vim'
Plug 'ap/vim-buftabline'

" Fuzzy finder
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Languages

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'marlonfan/coc-phpls'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'leafgarland/typescript-vim'

call plug#end()

" autocmd vimenter * NERDTree
colorscheme nord

" COC
source /home/adam/.config/nvim/coc.vim

" Use auocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }

" Close vim when NERDTree is the only open buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" =============================================================================
" # Settings
" =============================================================================
set list
set listchars=tab:→\ ,trail:·,space:·,extends:»,precedes:«

set tabstop=4
set shiftwidth=4
set expandtab
set relativenumber
set number

set keymodel=startsel,stopsel
set clipboard+=unnamedplus

" Sane splits
set splitright
set splitbelow

" Permanent undo
set undodir=~/.vimdid
set undofile

set mouse=a
set noshowmode

" =============================================================================
" # Key Bindings
" =============================================================================

command Q q
command W w
command WQ wq
command Wq wq

nnoremap ; :

noremap <silent> <C-Z>          ui
noremap <silent> <C-Z>          ui
inoremap <silent> <C-Z>         <C-o>ui
inoremap <silent> <C-Z>         <C-o>ui
inoremap <silent> <C-Z>         <C-o>ui
inoremap <silent> <C-Z>         <C-o>ui

" Slide lines up and down
nnoremap <A-j>                  :m .+1<CR>==
nnoremap <A-k>                  :m .-2<CR>==
inoremap <A-j>                  <Esc>:m .+1<CR>==gi
inoremap <A-k>                  <Esc>:m .-2<CR>==gi
vnoremap <A-j>                  :m '>+1<CR>gv=gv
vnoremap <A-k>                  :m '<-2<CR>gv=gv

nnoremap <A-Down>               :m .+1<CR>==
nnoremap <A-Up>                 :m .-2<CR>==
inoremap <A-Down>               <Esc>:m .+1<CR>==gi
inoremap <A-Up>                 <Esc>:m .-2<CR>==gi
vnoremap <A-Down>               :m '>+1<CR>gv=gv
vnoremap <A-Up>                 :m '<-2<CR>gv=gv

" normal copy/paste
vmap <C-c>                      y<Esc>i
vmap <C-x>                      d<Esc>i
imap <C-v>                      <Esc>pi
imap <C-c>                      <Esc>yyi
imap <C-x>                      <Esc>ddi
map <C-v>                       pi
map <C-c>                       yyi
map <C-x>                       ddi

" map <C-z> <Esc>
" imap <C-z> <Esc>ui

vmap <BS>                       "_d

noremap <silent> <C-S>          :w<CR>
vnoremap <silent> <C-S>         <C-C>:w<CR>
inoremap <silent> <C-S>         <C-O>:w<CR>

noremap <silent> <C-S-F>        :Rg<CR>
vnoremap <silent> <C-S-F>       :Rg<CR>
inoremap <silent> <C-S-F>       :Rg<CR>

noremap <silent> <C-p>          :GFiles<CR>
vnoremap <silent> <C-p>         :GFiles<CR>
inoremap <silent> <C-p>         :GFiles<CR>

" Fast Movement
noremap <silent> <C-Up>       10<Up>
vnoremap <silent> <C-Up>      <Esc>10<Up>v
inoremap <silent> <C-Up>      <Esc>10<Up>i
noremap <silent> <C-Down>       10<Down>
vnoremap <silent> <C-Down>      <Esc>10<Down>v
inoremap <silent> <C-Down>      <Esc>10<Down>i

" Tabs
noremap <silent> <C-t>          :tabe<CR>
inoremap <silent> <C-t>         <Esc>:tabe<CR>
vnoremap <silent> <C-t>         <Esc>:tabe<CR>

noremap <C-b> :NERDTreeToggle<CR>
inoremap <C-b> <C-o>:NERDTreeToggle<CR>

" Go to tab by number
noremap <leader>1 :b 1<CR>
noremap <leader>2 :b 2<CR>
noremap <leader>3 :b 3<CR>
noremap <leader>4 :b 4<CR>
noremap <leader>5 :b 5<CR>
noremap <leader>6 :b 6<CR>
noremap <leader>7 :b 7<CR>
noremap <leader>8 :b 8<CR>
noremap <leader>9 :b 9<CR>
noremap <leader>0 :b 10<cr>

noremap <silent> <C-Q> :bw<CR>
noremap <silent> <C-Tab> :bnext<CR>
noremap <silent> <C-S-Tab> :bprevious<CR>

