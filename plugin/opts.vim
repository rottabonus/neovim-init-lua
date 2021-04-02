"" KEYS {{{
inoremap fd <Esc>
"" No ex mode
nnoremap Q <nop>

"" fd to Esc
inoremap fd <Esc>
vnoremap fd <Esc>
tnoremap fd <C-\><C-n>

" Easier Moving between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Sizing window horizontally
nnoremap <A-,> <C-W>10<
nnoremap <A-.> <C-W>10>

" Sizing window vertically, s -> short, t -> tall
nnoremap <A-t> <C-W>10+
nnoremap <A-s> <C-W>10-

nnoremap <C-w>= :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <C-w>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <C-w>] :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <C-w>[ :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

" Map leader to space
let mapleader=" "

"" space space to like spacemacs
nnoremap <leader><leader> :
nnoremap <leader>q :Bdelete<CR>

"" save and trim white space
nnoremap <leader>w :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>:w<CR>

" Move lines, cool, but kinda not needed
nnoremap <M-k> :m .-2<CR>==
nnoremap <M-j> :m .+1<CR>==
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv

" Look for the selection, very nice trick
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>

" Very magic
vnoremap / /\v
nnoremap / /\v

"" bufs like tabs
nnoremap gb :bnext<CR>
nnoremap gB :bprevious<CR>

nnoremap <silent> yon :set invnumber<CR>:set invrelativenumber<CR>
nnoremap <silent> yoh :set invhlsearch<CR>
"" }}}

"" OPTIONS {{{
"" Tab handling
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

"" Scroll before top
set scrolloff=3
set sidescrolloff=3

"" GOtta be fast, async upd
set updatetime=100

"" line numbers
set number relativenumber

"" show command in bottom bar
set showcmd

" visual autocomplete for command menu
set wildmenu


"" TODO what does it do
set showmatch

"" Dunno what these do
set incsearch
set hlsearch

"" true colors?
set termguicolors

"" transparency is cool
set winblend=10
set pumblend=10
set completeopt=menuone,noinsert,noselect
"" }}}
