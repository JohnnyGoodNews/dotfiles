call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Status line
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-sensible'

" Add plugins to &runtimepath
call plug#end()

" Actual User Settings
set nocompatible
set hidden
set history=10000
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set showmatch
set incsearch
set hlsearch
set laststatus=2
set encoding=utf-8
set cursorline
" Height of bottom screen
set cmdheight=1
set switchbuf=useopen
" Tabline at top of screen
set showtabline=1
set winwidth=79
if has("win32unix") " Cygwin
    " set shell=<anything specific>
else " Other OS
    " set shell=zsh
endif
" Workaround
" set t_ti= t_te=
set scrolloff=3
" Store temporary files
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" Allow backspacing in Insert Mode
set backspace=indent,eol,start
" Display incomplete commands
set showcmd
" Syntam highlighting
syntax on
" filetype detection
filetype plugin indent on
" Emacs-style tab completion
set wildmode=longest,list
set wildmenu
let mapleader=","

" Custom Autocmds
augroup vimrcEx
    autocmd!
    autocmd FileType text setlocal textwidth=78
    " Jump to last cursor position unless invalid or in event handler
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
augroup END
   

" Python Development"
au BufNewFIle,BufRead *.py
	\ set tabstop=4
	\ set softtabstop=4
	\ set shiftwidth=4
	\ set textwidth=79
	\ set expandtab
	\ set autoindent
	\ set fileformat=unix

" HTML/CSS
au BufNewFile,BufRead *.js, *.html, *.css
	\ set tabstop=2
	\ set softtabstop=2
	\ set shiftwidth=2

" Flag Unnecessary Whitespace
au BufNewFile,BufRead *.py, *.pyw, *.c, *.h, *.java match BadWhitespace /\s\+$/

