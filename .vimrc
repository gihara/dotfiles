" -------------------------------------
" 基本設定
" -------------------------------------
colorscheme desert
let mapleader=","
packadd! matchit

" Vim挙動設定
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
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set showmode
set directory=~/dotfiles/vimfiles/swap
set undodir=~/dotfiles/vimfiles/undo
set backupdir=~/dotfiles/vimfiles/backup

if has('win32') || has('win64')
  set shell=~\tools\vim74-kaoriya-win64\bash.exe
endif

" ファイルタイプごとの設定
au BufNewFile,BufRead *.md set wrap
au BufNewFile,BufRead *.md set shellslash
au BufNewFile,BufRead *.md inoremap <Esc> <Esc>:w<CR>
au BufNewFile,BufRead *.txt set wrap
au BufNewFile,BufRead *.txt inoremap <Esc> <Esc>:w<CR>

" 検索時に中心に表示
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz

" カーソルライン
autocmd WinEnter    * set cursorline
autocmd WinLeave    * set nocursorline
autocmd InsertEnter * set nocursorline
autocmd InsertLeave * set cursorline

" vimgrep系
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :<C-u>cfirst<CR>
nnoremap ]Q :<C-u>clast<CR>
autocmd QuickFixCmdPost *grep* cwindow

" スワップファイルがあったら読み取り専用で開く
augroup swapchoice-readonly
  autocmd!
  autocmd SwapExists * let v:swapchoice = 'o'
augroup END

" 基本的なkeymap読み込み
if filereadable(expand("~/.vimrc_base_map"))
  source ~/.vimrc_base_map
endif

" j/kで見た目上の行単位移動
nnoremap j gj
nnoremap k gk

" teraterm的なマウス対応
vmap <CR> "+y
nnoremap <RIGHTMOUSE> a <c-r>+<Esc>
vnoremap <RIGHTMOUSE> a <c-r>+<Esc>

" 独自コマンド
command! RC :tabnew $MYVIMRC
command! D :%d

" -------------------------------------
" vim-plug 設定
" -------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'bronson/vim-trailing-whitespace'
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'Shougo/junkfile.vim'
Plug 'easymotion/vim-easymotion'
Plug 'altercation/vim-colors-solarized'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'

call plug#end()

filetype plugin indent on

" -------------------------------------
" プラグイン設定
" -------------------------------------

" easy-motion
map  <Space>f <Plug>(easymotion-bd-w)
nmap <Space>f <Plug>(easymotion-overwin-w)

" ctrlp
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

" tagbar
nmap <F8> :TagbarToggle<CR>

