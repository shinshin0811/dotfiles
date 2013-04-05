if has('vim_starting')
	set runtimepath+=~/.vim/neobundle.vim.git
	call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'https://github.com/Shougo/vimproc.git'
NeoBundle 'Shougo/neocomplcache.git'
NeoBundle 'Shougo/neosnippet.git'
" NeoBundle 'vim-scripts/VimCoder.jar'
NeoBundle 'Shougo/unite.vim.git'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'eagletmt/onlinejudge-vim'

filetype plugin on
filetype indent on

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing
syntax enable
set number
set encoding=utf-8
set tabstop=2
set autoindent
set smartindent
set shiftwidth=2
set nowrapscan
set ignorecase
set smartcase
set tw=0
set nobackup
set hlsearch 
call pathogen#runtime_append_all_bundles()

:set guioptions-=T
:set clipboard+=autoselect
:set clipboard+=unnamed
let g:solarized_termcolors=16
colorscheme solarized
" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup
"--------------------------------------------------------------------------
" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1 "大文字が入力されるまで，大文字と小文字を無視
let g:neocomplcache_enable_underbar_completion = 1  " _区切りの補完を有効化
inoremap <expr><C-l> neocomplcache#complete_common_string()
inoremap <expr><C-e> neocomplcache#cancel_popup()
" Enable omni completion. Not required if they are already set elsewhere in .vimrc
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
let g:neocomplcache_same_filetype_lists = {}
"--------------------------------------------------------------------------
" neosnippet

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
let g:neosnippet#enable_snipmate_compatibility = 1
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
"------------------------------------
" unite.vim
"------------------------------------
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-U><C-B> :Unite buffer<CR>
" ファイル一覧
noremap <C-U><C-F> :UniteWithBufferDir -buffer-name=files file<CR>
" 最近使ったファイルの一覧
noremap <C-U><C-R> :Unite file_mru<CR>
" レジスタ一覧
noremap <C-U><C-Y> :Unite -buffer-name=register register<CR>
" ファイルとバッファ
noremap <C-U><C-U> :Unite buffer file_mru<CR>
" 全部
noremap <C-U><C-A> :Unite UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" " ファイルを開く時、ウィンドウを分割して開く
 au FileType unite nnoremap <silent> <buffer> <expr> <C-v>  unite#do_action('split')
 au FileType unite inoremap <silent> <buffer> <expr> <C-v> unite#do_action('split')
"
" " ファイルを開く時、ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-h> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-h> unite#do_action('vsplit')

" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

"------------------------------------------------------------------------------
" onlinejudge-vim
let g:onlinejudge_account={
	\ 'aoj':{'user': 'shinshin0811' , 'pass': 'appletokyo'},
	\ }

