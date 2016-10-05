colorscheme desert " gvimではない場合はこっち

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimの挙動設定系
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autochdir "vimshellを使うならコメントアウト
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
"set expandtab
set tabstop=4
set shiftwidth=4
set helplang=en
set display=lastline
set pumheight=10
set showmatch
set matchtime=1
set nf=""

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
" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'
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

"" Javascript Bundle
NeoBundle 'jelera/vim-javascript-syntax'

"" HTML Bundle
NeoBundle 'amirh/HTML-AutoCloseTag'
NeoBundle 'tpope/vim-haml'
" js補完
NeoBundle 'mattn/jscomplete-vim'
NeoBundle 'pangloss/vim-javascript'
" css3ハイライト
NeoBundle 'JulesWang/css.vim'
" ワーキングドラフトになっているものもハイライト
NeoBundle 'hail2u/vim-css3-syntax'
" CSSの配色を実際にVimで表現する
NeoBundle 'gorodinskiy/vim-coloresque'
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
" JunkFile
NeoBundle 'Shougo/junkfile.vim'

" Markdown用
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

" easy-motion
NeoBundle 'easymotion/vim-easymotion'

" Solarized
NeoBundle 'altercation/vim-colors-solarized'

" jedi-vim
NeoBundle "davidhalter/jedi-vim"

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
set directory=~/dotfiles/vimfiles/swap
set undodir=~/dotfiles/vimfiles/undo
set backupdir=~/dotfiles/vimfiles/backup


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin　の設定達
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Shougoさん系
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
" jscomplete
""""""""""""""""""""""""""""""
let g:jscomplete_use = ['dom', 'moz']
" => autoload/js/dom.vim と autoload/js/moz.vim が読まれる

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

""""""""""""""""""""""""""""""
" NERDTREE
""""""""""""""""""""""""""""""
map <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""""""""""""""""""""""""""""""
" easy-motion
""""""""""""""""""""""""""""""
" Move to word
map  <Space>f <Plug>(easymotion-bd-w)
nmap <Space>f <Plug>(easymotion-overwin-w)

""""""""""""""""""""""""""""""
" jedi-vim
""""""""""""""""""""""""""""""
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings = 0
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
source $HOME/.vimrc_base_map

" .vimrc_base_mapに入れたら、vrapperで動かなくなった。。。
nnoremap j gj
nnoremap k gk

" rubyで遊ぼう
let g:neocomplete#sources#dictionary#dictionaries = {
\   'ruby': $HOME . '/dicts/ruby.dict',
\ }

