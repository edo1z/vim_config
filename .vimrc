call plug#begin('~/.vim/plugged')

" Color Scheme plugins
Plug 'sjl/badwolf'
Plug 'lucasprag/simpleblack'
Plug 'jaredgorski/spacecamp'

" NerdTree Plugins
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'PhilRunninger/nerdtree-buffer-ops'
Plug 'PhilRunninger/nerdtree-visual-selection'

" fzf Plugins
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'

" other plugin
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'fatih/vim-go'
Plug 'pangloss/vim-javascript'
Plug 'majutsushi/tagbar'
Plug 'itchyny/lightline.vim'
"Plug 'SirVer/ultisnips'
Plug 'neoclide/coc.nvim'
Plug 'junegunn/vim-easy-align'
Plug 'jiangmiao/auto-pairs'
Plug 'editorconfig/editorconfig-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mattn/emmet-vim'
Plug 'simeji/winresizer'

call plug#end()

"""""""""""""""""""
" Basic Setting
"""""""""""""""""""
syntax on
set t_Co=256
set title
set number
set ambiwidth=double
set expandtab
set tabstop=2
set shiftwidth=2
set belloff=all
set softtabstop=0
set smartindent
set ttyfast
set noswapfile
set laststatus=2
" コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set wildmenu
" 入力中のコマンドを表示する
set showcmd
" 小文字のみで検索したときに大文字小文字を無視する
set smartcase
" 検索結果をハイライト表示する
set hlsearch
" F10でpasteモードのトグルになる
set pastetoggle=<F10>
nnoremap <F10> :set paste!<CR>:set paste?<CR>
" xで削除した時はヤンクしない
vnoremap x "_x
nnoremap x "_x
" 改行時の自動コメントアウトの無効化
set formatoptions-=ro
autocmd FileType * setlocal formatoptions-=ro
" yankのクリップボード連携
set clipboard=unnamed

"""""""""""""""""""
" Color Scheme
"""""""""""""""""""
colorscheme badwolf
"colorscheme spacecamp
"colorscheme simpleblack
"hi Comment ctermfg=247
"hi LineNr ctermfg=244

""""""""""""""""""""""""""""""
" Keymap設定
""""""""""""""""""""""""""""""
nnoremap ; :
nnoremap : ;
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap <Space>h ^
nnoremap <Space>l $
cnoremap <Space>j $<CR>
nnoremap <Space>w :w<CR>
nnoremap <Space>q :q<CR>
nnoremap <Esc><Esc> :nohlsearch<CR>
inoremap jj <Esc>
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>

""""""""""""""""""""""""""""""
" NERDTreeの設定
""""""""""""""""""""""""""""""
"NERDTreeの表示切替
nnoremap <Space>n :NERDTreeToggle<CR>
" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow
" 隠しファイル表示
let NERDTreeShowHidden=1
" 自動クローズ
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

""""""""""""""""""""""""""""""
" fzfの設定
""""""""""""""""""""""""""""""
nnoremap <Space>b :Buffers<CR>
nnoremap <Space>f :GFiles<CR>
nnoremap <Space>t :History<CR>

""""""""""""""""""""""""""""""
" lightlineの設定
""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

set noshowmode

""""""""""""""""""""""""""""""
" 画面分割・タブページの設定
""""""""""""""""""""""""""""""
nnoremap s <Nop>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H

" tab
nnoremap sn gt
nnoremap sp gT
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>

nnoremap th :<C-u>-tabm<CR>
nnoremap tl :<C-u>+tabm<CR>
nnoremap t0 :<C-u>0tabm<CR>

nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>

""""""""""""""""""""""""""""""
" Vim-goの設定
""""""""""""""""""""""""""""""
let g:go_bin_path = $GOBIN
let g:go_highlight_types = 0
let g:go_highlight_operators = 0
let g:syntastic_go_checkers = ['go', 'golint']
filetype plugin indent on
nnoremap [go] <Nop>
nmap     <Space>g [go]
nnoremap [go]r :GoRun
nnoremap [go]e :GoErrCheck<CR>
nnoremap [go]d :GoDef<CR>


