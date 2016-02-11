set nowrap
set formatoptions=q

" set imdisable 
" ウインドウの幅
set columns=130
" ウインドウの高さ
set lines=40

" IME関連
set iminsert=0
set imsearch=-1

colorscheme solarized
set background=dark

if has('win32') || has ('win64')
	set guifont=Migu_1M:h12
	set transparency=220
	autocmd FocusGained * set transparency=220
	autocmd FocusLost * set transparency=128
elseif has('mac')
	set transparency=10
	autocmd FocusGained * set transparency=10
	autocmd FocusLost * set transparency=40
endif
