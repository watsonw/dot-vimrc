" Install or update all bundles form github
source ~/.vim/bundles.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible
set nocompatible

" Uncomment the next line to set default encoding order
"set fenc =utf-8
"set fileencodings =utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
"set enconding=utf-8
set fileformats=unix,dos,mac

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
" syntax enable
if has("syntax")
  syntax on
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" All my marcos start with , as <LocalLeader>
let maplocalleader=','

" Need confirm if process read-only or un-saved file
set confirm

"--------------------------------
"           Vim UI
"--------------------------------
" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" set font and size
if has("gui_running")
  set guifont=consolas\ 14
  "set guifont=monaco\ 11
else
  if $TERM == "xterm"
    set t_Co=256
  endif
endif

" load my customized color scheme
colorscheme watsonw

" highlight current line
"au WinLeave * set nocursorline nocursorcolumn
"au WinEnter * set cursorline cursorcolumn
"set cursorline cursorcolumn

" Uncomment the following to have Vim jump to the last position when reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" History lines
set history=1000

" Uncommet to enable smart backspace
set backspace=indent,eol,start

" Automatically save before commands like :next and :make
"set autowrite

" Automatically reload file when file is modified
" set autoread

" Hide buffers when they are abandoned
"set hidden

" Enable mouse usage (all modes)
set mouse=a

" Dont wrap lines
set nowrap

" Uncommenet the following to show line number
set number
set ruler

set magic
set title

" status line
set laststatus=2

" set command height at the bottom of editing area
set cmdheight=1

" Uncomment the next line makes word with before char not be wrapped
set iskeyword+=_,$,@,%,#,-

" Uncomment below to enable save files using Ctrl+S or s
" nmap <C-s> <ESC>:w<CR>
" imap <C-s> <C-O>:w<CR>
noremap   <C-s> :update<CR>
vnoremap  <C-s> <ESC>:update<CR>
inoremap  <C-s> <ESC>:update<CR>

"""""""""""""""""""""""""""""""
" Search and match
"""""""""""""""""""""""""""""""
set showmatch			" Show matching brackets
set ignorecase			" Do case insensitive matching
set smartcase			" Do smart case matching
set incsearch			" Incremental search, search as you type
set hlsearch			" Highlight search results
set vb t_vb=
set novisualbell		" No flickering
set noerrorbells

"""""""""""""""""""""""""""""""
" File formats and composing
"""""""""""""""""""""""""""""""
"set formatoptions=tcrqn			" add comment chars to current line
set shiftwidth=4
set tabstop=4
"set expandtab
set noexpandtab
"set smarttab

" expand tab for different file types
au FileType html,python,vim,javascript setl shiftwidth=2
au FileType html,python,vim,javascript setl tabstop=2
au FileType java,php,c,cpp setl shiftwidth=4
au FileType java,php,c,cpp setl tabstop=4

set autoindent			" auto indent current line as previous line
set smartindent			" auto indent for C code
"set softtabstop=4
"set textwidth=80

" show all symbols include whitespace, tab and eol
" set list				                " show all symbols
set listchars=tab:»·,trail:·			" turn TAB symbol to '>---'

" fold code -> space key
"set foldenable
"set foldmethod=indent
"nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto load vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Fast reloading of the .vimrc
nmap <silent> <LocalLeader>sv :source ~/.vimrc<cr>
"Fast editing of .vimrc
nmap <silent> <LocalLeader>ev :e ~/.vimrc<cr>
"When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Useful Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
      \ if ! exists("g:leave_my_cursor_position_alone") |
      \     if line("'\"") > 0 && line ("'\"") <= line("$") |
      \         exe "normal g'\"" |
      \     endif |
      \ endif

" w!! to sudo & write a file
cmap w!! %!sudo tee >/dev/null %

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rainbow parentheses for Lisp and variants
let g:rbpt_colorpairs = [
	\ ['brown',        'RoyalBlue3'],
	\ ['Darkblue',     'SeaGreen3'],
	\ ['darkgray',     'DarkOrchid3'],
	\ ['darkgreen',    'firebrick3'],
	\ ['darkcyan',     'RoyalBlue3'],
	\ ['darkred',      'SeaGreen3'],
	\ ['darkmagenta',  'DarkOrchid3'],
	\ ['brown',        'firebrick3'],
	\ ['gray',         'RoyalBlue3'],
	\ ['black',        'SeaGreen3'],
	\ ['darkmagenta',  'DarkOrchid3'],
	\ ['Darkblue',     'firebrick3'],
	\ ['darkgreen',    'RoyalBlue3'],
	\ ['darkcyan',     'SeaGreen3'],
	\ ['darkred',      'DarkOrchid3'],
	\ ['red',          'firebrick3'],
	\ ]
let g:rbpt_max = 16
autocmd Syntax lisp,scheme,clojure,racket RainbowParenthesesToggle

" tabbar
let g:Tb_MaxSize = 2
let g:Tb_TabWrap = 1

hi Tb_Normal guifg=white ctermfg=white
hi Tb_Changed guifg=green ctermfg=green
hi Tb_VisibleNormal ctermbg=252 ctermfg=235
hi Tb_VisibleChanged guifg=green ctermbg=252 ctermfg=white

" easy-motion
let g:EasyMotion_leader_key = '<LocalLeader>'

" Tagbar
let g:tagbar_left=1
let g:tagbar_width=30
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1
" tag for coffee
if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }

  let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'sort' : 0,
    \ 'kinds' : [
        \ 'h:sections'
    \ ]
    \ }
endif

" Nerd Tree
let NERDChristmasTree=0
let NERDTreeWinSize=30
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
" let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos = "right"

" nerdcommenter
let NERDSpaceDelims=1
" nmap <D-/> :NERDComToggleComment<cr>
let NERDCompactSexyComs=1

" ZenCoding
let g:user_emmet_expandabbr_key='<C-j>'

" powerline
"let g:Powerline_symbols = 'fancy'

" NeoComplCache
let g:neocomplcache_enable_at_startup=1
let g:neoComplcache_disableautocomplete=1
"let g:neocomplcache_enable_underbar_completion = 1
"let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
set completeopt-=preview

imap <C-k> <Plug>(neocomplcache_snippets_force_expand)
smap <C-k> <Plug>(neocomplcache_snippets_force_expand)
imap <C-l> <Plug>(neocomplcache_snippets_force_jump)
smap <C-l> <Plug>(neocomplcache_snippets_force_jump)

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType c setlocal omnifunc=ccomplete#Complete
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.erlang = '[a-zA-Z]\|:'

" SuperTab
" let g:SuperTabDefultCompletionType='context'
let g:SuperTabDefaultCompletionType = '<C-X><C-U>'
let g:SuperTabRetainCompletionType=2

" ctrlp; shorcut is ctrl+p
set wildignore+=*/tmp/*,*.so,*.o,*.a,*.obj,*.swp,*.zip,*.pyc,*.pyo,*.class,.DS_Store  " MacOSX/Linux
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'

" Keybindings for plugin toggle
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
nmap <F5> :TagbarToggle<cr>
nmap <F6> :NERDTreeToggle<cr>
nmap <F3> :GundoToggle<cr>
nmap <F4> :IndentGuidesToggle<cr>
nmap  <D-/> :
nnoremap <LocalLeader>a :Ack
nnoremap <LocalLeader>v V`]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Exuberant ctags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tags=tags;
set autochdir

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Taglist and winmanager is replaced with tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let Tlist_Show_One_File=1
" let Tlist_Exit_OnlyWindow=1
"let g:winManagerWindowLayout='FileExplorer|TagList'
"nmap <LocalLeader>wm :WMToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" QuickFix
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <S-F9> :cp<CR>
nmap <S-F10> :cn<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MiniBufExplorer is replaced with Tabbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " C-w,h j k l  to switch windows
" let g:miniBufExplMapWindowNavVim = 1
" " C-arrow_key to switch windows
" let g:miniBufExplMapWindowNavArrows = 1
" let g:miniBufExplMapCTabSwitchBufs = 1
" let g:miniBufExplModSelTarget = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" A -- for h,cpp files switch
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F12> :A<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Grep -- project search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nnoremap <silent> <F3> :Grep<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mark-karkat/vim-mark -- Highlight words like SourceInsight
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" higtlight/toggel current word
nmap <silent> <LocalLeader>hl <Leader>m
vmap <silent> <LocalLeader>hl <Leader>m
map  <S-F8> <Leader>m
" clear all hight or current word
nmap <silent> <LocalLeader>hc <Leader>n
vmap <silent> <LocalLeader>hc <Leader>n
" search regExp to highlight
nmap <silent> <LocalLeader>hr <Leader>r
vmap <silent> <LocalLeader>hr <Leader>r

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabularize -- improve readability of your code
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :Tabularize /:
" :Tabularize /:\zs

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" showmarks -- reset color to current color scheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlighting: Setup some nice colours to show the mark positions.
hi default ShowMarksHLl ctermfg=darkgreen   ctermbg=none cterm=bold guifg=blue     guibg=lightblue gui=bold
hi default ShowMarksHLu ctermfg=darkred     ctermbg=none cterm=bold guifg=darkred  guibg=lightblue gui=bold
hi default ShowMarksHLo ctermfg=lightblue   ctermbg=grey cterm=bold guifg=darkgrey guibg=lightblue gui=bold
hi default ShowMarksHLm ctermfg=darkmagenta ctermbg=none cterm=bold guifg=magenta  guibg=lightblue gui=bold

