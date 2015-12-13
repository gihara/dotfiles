colorscheme desert " shから呼び出した時に、怒られるから

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimの挙動設定系
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autochdir
set autochdir "vimshellを使うならコメントアウト
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
"set expandtab
set tabstop=4
set shiftwidth=4
set helplang=en
set display=lastline
set pumheight=10
set showmatch
set matchtime=1
set nf=""

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
NeoBundle 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'
" ファイルをtree表示してくれる
" NeoBundle 'scrooloose/nerdtree'
" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'
" シングルクオートとダブルクオートの入れ替え等
NeoBundle 'tpope/vim-surround'
" インデントに色を付けて見やすくする
NeoBundle 'nathanaelkane/vim-indent-guides'
" アウトラインを表示
NeoBundle 'Shougo/unite-outline'
" 補完
NeoBundle 'Shougo/neocomplete.vim'
" vimshell
NeoBundle 'Shougo/vimshell.vim'
" js補完
NeoBundle 'mattn/jscomplete-vim'
" emment
NeoBundle 'mattn/emmet-vim'
" 範囲拡大
NeoBundle 'terryma/vim-expand-region'
" statuslineをおしゃれに
NeoBundle 'itchyny/lightline.vim'
" syntax
NeoBundle 'scrooloose/syntastic'
" quickrun
NeoBundle 'thinca/vim-quickrun'

" Markdown用
" NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

" Solarized
NeoBundle 'altercation/vim-colors-solarized'

" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1

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
set directory=$HOME/dotfiles/vimfiles/swap
set undodir=$HOME/dotfiles/vimfiles/undo
set backupdir=$HOME/dotfiles/vimfiles/backup


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin　の設定達
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Shougoさん系
""""""""""""""""""""""""""""""
" Unit.vim
""""""""""""""""""""""""""""""
" バッファ一覧
noremap <C-P> :Unite buffer -start-insert<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file -start-insert<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru -start-insert<CR>
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

""""""""""""""""""""""""""""""
" neocomplete
""""""""""""""""""""""""""""""
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" Shougoさんここまで


""""""""""""""""""""""""""""""
" Previm.vim
""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.textile set filetype=textile
""let g:previm_open_cmd = 'open -a Firefox' これを入れておくと、previmの起動が出来ない
" http://blog.remora.cx/2010/12/vim-ref-with-unite.html


""""""""""""""""""""""""""""""
" Unite-outlin
""""""""""""""""""""""""""""""
command! Outline :Unite -no-quit -vertical  -winwidth=30 outline


""""""""""""""""""""""""""""""
" jscomplete
""""""""""""""""""""""""""""""
let g:jscomplete_use = ['dom', 'moz']
" => autoload/js/dom.vim と autoload/js/moz.vim が読まれる


""""""""""""""""""""""""""""""
" vim-expand-region
""""""""""""""""""""""""""""""
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)


""""""""""""""""""""""""""""""
" tcomment_vim
""""""""""""""""""""""""""""""
nnoremap <Space>/ :TComment<CR>
vnoremap <Space>/ :TComment<CR>


""""""""""""""""""""""""""""""
" openbrowser
""""""""""""""""""""""""""""""
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

""""""""""""""""""""""""""""""
" quickrun
""""""""""""""""""""""""""""""
let g:quickrun_config = {'*':{'split': ''}}
let g:quickrun_no_default_key_mappings = 1
au FileType qf nnoremap <silent><buffer>q :quit<CR>
nnoremap <Space>r :write<CR>:QuickRun -mode n<CR>
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 独自コマンド
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! RC :e $MYVIMRC " vimrcを開きやすく
command! D :%d " %打ちづらい

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" その他
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" "0p は打ちづらい。良く使うのに
nnoremap 0p "0p
vnoremap 0p "0p

" teraterm的な動作を
vmap <CR> "+y
nnoremap <RIGHTMOUSE> "+P

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
source $HOME/.vimrc_base_map

" .vimrc_base_mapに入れたら、vrapperで動かなくなった。。。
nnoremap j gj
nnoremap k gk

" rubyで遊ぼう
let g:neocomplete#sources#dictionary#dictionaries = {
\   'ruby': $HOME . '/dicts/ruby.dict',
\ }
