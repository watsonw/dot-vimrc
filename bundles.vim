set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle

" Keep Plugin commands between vundle#begin/end.
" Required!!
call vundle#begin()

" let Vundle manage Vundle itself
Plugin 'gmarik/vundle'

"------------------
" Code Completions
"------------------
Plugin 'Shougo/neocomplcache'
" provides support for expanding abbreviations
Plugin 'mattn/emmet-vim'
" provides insert mode auto-completion for quotes, parens, brackets, etc.
Plugin 'Raimondi/delimitMate'
" perform all your vim insert mode completions with Tab
Plugin 'ervandew/supertab'
" snippets
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
"------ snipmate dependencies -------
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'

"-----------------
" Fast navigation
"-----------------
Plugin 'edsono/vim-matchit'
Plugin 'Lokaltog/vim-easymotion'

"--------------
" Fast editing
"--------------
Plugin 'tpope/vim-surround'
" <Leader>cc and <Leader>cu or <Leader>c to toggle
Plugin 'scrooloose/nerdcommenter'
Plugin 'sjl/gundo.vim'
" text filtering and auto alignment such as variable definitions
Plugin 'godlygeek/tabular'
Plugin 'nathanaelkane/vim-indent-guides'

"--------------
" IDE features
"--------------
Plugin 'scrooloose/nerdtree'
Plugin 'humiaozuzu/TabBar'
" displays tags in a window ordered by scope
Plugin 'majutsushi/tagbar'
" fuzzy file, buffer, mru, tag, etc. finder
Plugin 'kien/ctrlp.vim'
" a powerful git wrapper
Plugin 'tpope/vim-fugitive'
" the ultimate vim statusline utility
Plugin 'Lokaltog/vim-powerline'
" syntax checking hacks for vim
Plugin 'scrooloose/syntastic'
" highlight trailing whitespaces in red
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'vernonrj/Mark--Karkat'
" Plugin 'jrosiek/vim-mark'
Plugin 'ShowMarks'
Plugin 'azzurris/Visual-Mark'

"-------------
" Other Utils
"-------------
" Plugin 'humiaozuzu/fcitx-status'
Plugin 'nvie/vim-togglemouse'

"----------------------------------------
" Syntax/Indent for language enhancement
"----------------------------------------
"------- web backend ---------
Plugin '2072/PHP-Indenting-for-VIm'
"Plugin 'tpope/vim-rails'
"Plugin 'lepture/vim-jinja'
"Plugin 'digitaltoad/vim-jade'
" perl module or CLI script ACK
"Plugin 'mileszs/ack.vim'

"------- web frontend ----------
Plugin 'othree/html5.vim'
" Plugin 'tpope/vim-haml'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'nono/jquery.vim'
" Plugin 'groenewege/vim-less'
" Plugin 'wavded/vim-stylus'
" Plugin 'nono/vim-handlebars'

"------- markup language -------
Plugin 'tpope/vim-markdown'
" Plugin 'timcharper/textile.vim'

"------- Ruby --------
Plugin 'vim-ruby/vim-ruby'
" Plugin 'tpope/vim-endwise'

"------- Go ----------
Plugin 'fatih/vim-go'

"------- FPs ------
Plugin 'kien/rainbow_parentheses.vim'
" Plugin 'wlangstroth/vim-racket'
" Plugin 'vim-scripts/VimClojure'
" Plugin 'rosstimson/scala-vim-support'

"--------------
" Color Schemes
"--------------
Plugin 'tomasr/molokai'
Plugin 'rickharris/vim-blackboard'
Plugin 'altercation/vim-colors-solarized'
Plugin 'rickharris/vim-monokai'
Plugin 'tpope/vim-vividchalk'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'fisadev/fisa-vim-colorscheme'
"Plugin 'vim-scripts/wombat256'

" Required!! plugins available after.
call vundle#end()

filetype plugin indent on
