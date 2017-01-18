colorscheme desert " windowsではmingw32でvimを使うため
let mapleader=","
packadd! matchit
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimの挙動設定系
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autochdir
set noerrorbells
set novisualbell
set t_vb=
set number
set ruler
set list
set listchars=tab:->,trail:-,nbsp:%,extends:>
set incsearch
set hlsearch
set whichwrap=h,l
set nowrapscan
set ignorecase
set smartcase
set hidden
set history=2000
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set display=lastline
set pumheight=10
set showmatch
set matchtime=1
set nf=""
set fileencoding=utf-8
set nobomb

if has('win32') || has ('win64')
	set shell=~\tools\vim74-kaoriya-win64\bash.exe
endif

au BufNewFile,BufRead *.md set wrap
au BufNewFile,BufRead *.md set shellslash
au BufNewFile,BufRead *.md inoremap <Esc> <Esc>:w<CR>
au BufNewFile,BufRead *.txt set wrap
au BufNewFile,BufRead *.txt inoremap <Esc> <Esc>:w<CR>

nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz

" 常にステータス行を表示
set laststatus=2
"ステータスラインに文字コードと改行文字を表示する
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" 現在のモードを表示する
set showmode

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundle plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
let g:neobundle_default_git_protocol='https'
" 空白文字を赤くハイライトしてくれるのは便利
NeoBundle 'bronson/vim-trailing-whitespace'
" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'
" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'
" シングルクオートとダブルクオートの入れ替え等
NeoBundle 'tpope/vim-surround'
" インデント
NeoBundle 'Yggdroot/indentLine'

" quickrun
" NeoBundle 'thinca/vim-quickrun'
" statuslineをおしゃれに
NeoBundle 'itchyny/lightline.vim'
" JunkFile
NeoBundle 'Shougo/junkfile.vim'

" easy-motion
NeoBundle 'easymotion/vim-easymotion'

" Solarized
NeoBundle 'altercation/vim-colors-solarized'

" CtrlP
NeoBundle 'ctrlpvim/ctrlp.vim'

" tagbar
NeoBundle 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
" NeoBundleCheck
"

" swp output directory
set directory=~/dotfiles/vimfiles/swap
set undodir=~/dotfiles/vimfiles/undo
set backupdir=~/dotfiles/vimfiles/backup


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin　の設定達
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
" easy-motion
""""""""""""""""""""""""""""""
" Move to word
map  <Space>f <Plug>(easymotion-bd-w)
nmap <Space>f <Plug>(easymotion-overwin-w)

""""""""""""""""""""""""""""""
" ctrl-p
""""""""""""""""""""""""""""""
let g:ctrlp_map = '<Nop>'
nnoremap <C-h> :CtrlPMRUFiles<CR>
nnoremap <C-P> :CtrlPBuffer<CR>
nnoremap <C-n> :CtrlPCurFile<CR>
let g:ctrlp_prompt_mappings = {
  \ 'PrtBS()':              ['<c-h>','<BS>'],
  \ 'PrtDeleteWord()':      ['<c-w>'],
  \ 'PrtCurEnd()':          ['<c-e>'],
  \ 'PrtCurLeft()':         ['<c-b>'],
  \ 'PrtCurRight()':        ['<c-f>'],
  \ 'PrtSelectMove("j")':   ['<c-n>'],
  \ 'PrtSelectMove("k")':   ['<c-p>'],
  \ 'PrtHistory(-1)':       ['<UP>'],
  \ 'PrtHistory(1)':        ['<DOWN>'],
  \}


""""""""""""""""""""""""""""""
" easy-motion
""""""""""""""""""""""""""""""
" Move to word
map  <Space>f <Plug>(easymotion-bd-w)
nmap <Space>f <Plug>(easymotion-overwin-w)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 独自コマンド
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! RC :tabnew $MYVIMRC " vimrcを開きやすく
command! D :%d " %打ちづらい

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" その他
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cursoline
autocmd WinEnter    * set cursorline
autocmd WinLeave    * set nocursorline
autocmd InsertEnter * set nocursorline
autocmd InsertLeave * set cursorline

" teraterm的な動作を
vmap <CR> "+y
nnoremap <RIGHTMOUSE> a <c-r>+<Esc>
vnoremap <RIGHTMOUSE> a <c-r>+<Esc>
" 大体行末にコピーするから半角スペースが入ってくれると助かる

""""""""""""""""""""""""""""""
" vimgrep
""""""""""""""""""""""""""""""
nnoremap [q :cprevious<CR>   " 前へ
nnoremap ]q :cnext<CR>       " 次へ
nnoremap [Q :<C-u>cfirst<CR> " 最初へ
nnoremap ]Q :<C-u>clast<CR>  " 最後へ

autocmd QuickFixCmdPost *grep* cwindow

""""""""""""""""""""""""""""""
" swapがあったら読み込み専用で開く
""""""""""""""""""""""""""""""
augroup swapchoice-readonly
  autocmd!
  autocmd SwapExists * let v:swapchoice = 'o'
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 基本的なkeymapを読み込み
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable(expand("~/.vimrc_base_map"))
  source ~/.vimrc_base_map
endif

" .vimrc_base_mapに入れたら、vrapperで動かなくなった。。。
nnoremap j gj
nnoremap k gk

