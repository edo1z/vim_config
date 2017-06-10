if &compatible
	set nocompatible
endif
set runtimepath+=~/.vim/dein.vim

call dein#begin(expand('~/.vim/dein'))

"""""""""""""""""""
" Color Scheme plugin
"""""""""""""""""""
call dein#add('tomasr/molokai')
call dein#add('sjl/badwolf')
"""""""""""""""""""

call dein#add('Shougo/unite.vim')
call dein#add('scrooloose/nerdtree')
call dein#add('tpope/vim-pathogen')
call dein#add('tpope/vim-fugitive')
call dein#add('tomtom/tcomment_vim')
call dein#add('vim-scripts/AnsiEsc.vim')
call dein#add('bronson/vim-trailing-whitespace')
call dein#add('kana/vim-smartinput')
call dein#add('itchyny/lightline.vim')
call dein#add('kana/vim-submode')
call dein#add('fatih/vim-go')
call dein#end()

if dein#check_install()
	call dein#install()
endif

"""""""""""""""""""
" Basic Setting
"""""""""""""""""""
syntax on
set t_Co=256
set title
set number
set ambiwidth=double
set tabstop=4
set noexpandtab
set shiftwidth=4
set softtabstop=0
set smartindent
set ttyfast
set noswapfile
set laststatus=2
" ウインドウのタイトルバーにファイルのパス情報等を表示する
set title
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
"pathをいい感じにしてくれるらしい
execute pathogen#infect()

"""""""""""""""""""
" Color Scheme
"""""""""""""""""""
augroup TransparentBG
  	autocmd!
	autocmd Colorscheme * highlight Normal ctermbg=none
	autocmd Colorscheme * highlight NonText ctermbg=none
	autocmd Colorscheme * highlight LineNr ctermbg=none
	autocmd Colorscheme * highlight Folded ctermbg=none
augroup END

set background=dark
colorscheme badwolf
hi Comment ctermfg=247
hi LineNr ctermfg=244

""""""""""""""""""""""""""""""
" Keymap設定
""""""""""""""""""""""""""""""
nnoremap ; :
nnoremap : ;
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap <Space>j $
cnoremap <Space>j $<CR>
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>

""""""""""""""""""""""""""""""
" NERDTreeの設定
""""""""""""""""""""""""""""""
"NERDTreeの表示
nnoremap <Space>n :NERDTree<CR>
" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow

""""""""""""""""""""""""""""""
" Unit.vimの設定
""""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

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
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>

call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')


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


