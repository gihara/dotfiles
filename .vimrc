set number
set ruler
set list
set listchars=tab:->,trail:-,nbsp:%,extends:>
set incsearch
set hlsearch
set showmatch
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
set helplang=en
set display=lastline
set pumheight=10
set showmatch
set matchtime=1
set nf=""
set autochdir

" 常にステータス行を表示
set laststatus=2
"ステータスラインに文字コードと改行文字を表示する
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" 現在のモードを表示する
set showmode
" Reset Highlight
nnoremap <Esc><Esc> :noh<CR>


" 改行を入れる
nnoremap <c-j> i<CR><Esc>

"<space>j, <space>kで画面送り
noremap <Space>j <C-f>
noremap <Space>k <C-b>

" 挿入モードでのカーソル移動
inoremap <c-j> <Down>
inoremap <c-k> <Up>
inoremap <c-h> <Left>
inoremap <c-l> <Right>

" 挿入モードで単語単位/行単位の削除をアンドゥ可能にする
inoremap <C-u>  <C-g>u<C-u>
inoremap <C-w>  <C-g>u<C-w>

" 引用符, 括弧の設定
"inoremap { {}<Left>
"inoremap [ []<Left>
"inoremap ( ()<Left>
"inoremap " ""<Left>
"inoremap ' ''<Left>
inoremap <> <><Left>

" コマンドモード
cnoremap <c-f> <Right>
cnoremap <c-b> <Left>
cnoremap <c-a> <c-b>
cnoremap <c-e> <c-e>
cnoremap <c-u> <c-e><c-u>
cnoremap <c-v> <c-f>a

" vimgrep
nnoremap [q :cprevious<CR>   " 前へ
nnoremap ]q :cnext<CR>       " 次へ
nnoremap [Q :<C-u>cfirst<CR> " 最初へ
nnoremap ]Q :<C-u>clast<CR>  " 最後へ

autocmd QuickFixCmdPost *grep* cwindow
