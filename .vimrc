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
"set expandtab
set tabstop=4
set shiftwidth=4
set helplang=en
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

" NERDTREE
NeoBundle 'scrooloose/nerdtree'
" 補完
if has('lua') " lua機能が有効になっている場合・・・・・・①
    " コードの自動補完
    NeoBundle 'Shougo/neocomplete.vim'
    " スニペットの補完機能
    NeoBundle "Shougo/neosnippet"
    " スニペット集
    NeoBundle 'Shougo/neosnippet-snippets'
endif
" ptyhon
NeoBundleLazy "davidhalter/jedi-vim", {
    \ "autoload": { "filetypes": [ "python", "python3", "djangohtml"] }}
if ! empty(neobundle#get("jedi-vim"))
  let g:jedi#auto_initialization = 1
  let g:jedi#auto_vim_configuration = 1

  nnoremap [jedi] <Nop>
  xnoremap [jedi] <Nop>
  nmap <Leader>j [jedi]
  xmap <Leader>j [jedi]

  let g:jedi#completions_command = "<C-Space>"    " 補完キーの設定この場合はCtrl+Space
  let g:jedi#goto_assignments_command = "<C-]>"   " 変数の宣言場所へジャンプ（Ctrl + g)
  let g:jedi#goto_definitions_command = "<C-]>"   " クラス、関数定義にジャンプ（Gtrl + d）
  let g:jedi#documentation_command = "<C-k>"      " Pydocを表示（Ctrl + k）
  let g:jedi#rename_command = "[jedi]r"
  let g:jedi#usages_command = "[jedi]n"
  let g:jedi#popup_select_first = 0
  let g:jedi#popup_on_dot = 0

  autocmd FileType python setlocal completeopt-=preview

  " for w/ neocomplete
    if ! empty(neobundle#get("neocomplete.vim"))
        autocmd FileType python setlocal omnifunc=jedi#completions
        let g:jedi#completions_enabled = 0
        let g:jedi#auto_vim_configuration = 0

        if !exists('g:neocomplete#force_omni_input_patterns')
                let g:neocomplete#force_omni_input_patterns = {}
        endif
        let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
    endif
endif
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
" syntastic
NeoBundle 'scrooloose/syntastic'

" quickrun
" NeoBundle 'thinca/vim-quickrun'
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

" CtrlP
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'rking/ag.vim'
" 関数検索
NeoBundle 'tacahiroy/ctrlp-funky'
" CtrlPの拡張プラグイン. コマンド履歴検索
NeoBundle 'suy/vim-ctrlp-commandline'

" tagbar
NeoBundle 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

" easy-motion
NeoBundle 'easymotion/vim-easymotion'
""""""""""""""""""""""""""""""
" easy-motion
""""""""""""""""""""""""""""""
" Move to word
map  <Space>f <Plug>(easymotion-bd-w)
nmap <Space>f <Plug>(easymotion-overwin-w)

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
" ctrl-p ag
""""""""""""""""""""""""""""""
if executable('ag')
  let g:ctrlp_use_caching=0
  let g:ctrlp_user_command = 'ag -i --nocolor --nogroup --hidden -g "" %s'
endif
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
" Shougoさん系
""""""""""""""""""""""""""""""
" neocomplete
""""""""""""""""""""""""""""""
if neobundle#is_installed('neocomplete.vim')
	"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
	" 3文字以上の単語に対して補完を有効にする
	let g:neocomplete#min_keyword_length = 3
	" 区切り文字まで補完する
	let g:neocomplete#enable_auto_delimiter = 1
	" 1文字目の入力から補完のポップアップを表示
	let g:neocomplete#auto_completion_start_length = 1

	" C-kで補完候補の確定. スニペットの展開もC-kで確定
	imap <expr><C-s> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "<C-y>" : "<CR>"
	" タブキーで補完候補の選択. スニペット内のジャンプもタブキーでジャンプ
	imap <expr><TAB> pumvisible() ? "<C-n>" : neosnippet#jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : "<TAB>"
	smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
	" C-yでスニペット
	imap <C-s> <Plug>(neosnippet_expand_or_jump)
	smap <C-s> <Plug>(neosnippet_expand_or_jump)
	xmap <C-s> <Plug>(neosnippet_expand_or_jump)
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

endif
" Shougoさんここまで


""""""""""""""""""""""""""""""
" Previm.vim
""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.textile set filetype=textile
""let g:previm_open_cmd = 'open -a Firefox' これを入れておくと、previmの起動が出来ない
" http://blog.remora.cx/2010/12/vim-ref-with-unite.html

""""""""""""""""""""""""""""""
" open-browser
""""""""""""""""""""""""""""""
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-open)
vmap gx <Plug>(openbrowser-open)

""""""""""""""""""""""""""""""
" jscomplete
""""""""""""""""""""""""""""""
let g:jscomplete_use = ['dom', 'moz']
" => autoload/js/dom.vim と autoload/js/moz.vim が読まれる

""""""""""""""""""""""""""""""
" syntastic
""""""""""""""""""""""""""""""
let g:syntastic_javascript_checkers = ['jshint']

" エラー行に sign を表示
let g:syntastic_enable_signs = 1
" location list を常に更新
let g:syntastic_always_populate_loc_list = 0
" location list を常に表示
let g:syntastic_auto_loc_list = 0
" ファイルを開いた時にチェックを実行する
let g:syntastic_check_on_open = 1
" :wq で終了する時もチェックする
let g:syntastic_check_on_wq = 0
" Javascript以外は構文エラーチェックをしない
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
if filereadable(expand("~/.vimrc_base_map"))
  source ~/.vimrc_base_map
endif

" .vimrc_base_mapに入れたら、vrapperで動かなくなった。。。
nnoremap j gj
nnoremap k gk

" rubyで遊ぼう
let g:neocomplete#sources#dictionary#dictionaries = {
\   'ruby': $HOME . '/dicts/ruby.dict',
\ }

