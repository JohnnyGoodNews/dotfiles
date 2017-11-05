call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Status line
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'jnurmine/Zenburn'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'chriskempson/base16-vim'
Plug 'junegunn/seoul256.vim'

Plug 'NLKNguyen/papercolor-theme'

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
set ignorecase
set smartcase
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
set number

set clipboard^=unnamed,unnamedplus

colorscheme Tomorrow-Night-Eighties
" let base16colorspace=256 " For base16 colorschemes (needs base16 shell)
set background=light
colorscheme PaperColor

" space leader
let mapleader = "\<Space>"


" Workaround ConEmu
" ConEmu fix for 256 colors in Vim
" and remaps for fixing Windows Vim's weird
" Backspace behavior
if !empty($ConEmuBuild)
    " echom "Running ConEmu settings"
    set termencoding=utf8
    set term=xterm
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
    inoremap <Char-0x07F> <BS>
    nnoremap <Char-0x07F> <BS>
endif

if has("win32unix") " Cygwin
    " set shell=<anything specific>
else " Other OS
    " set shell=zsh
endif

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    " set guifont=Droid\ Sans\ Mono\ nohints:h12:cANSI
    set guifont=PragmataPro\ Mono:h12:cANSI
  endif
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
	\ softtabstop=4
	\ shiftwidth=4
	\ textwidth=79
	\ expandtab
	\ autoindent
	\ fileformat=unix

" HTML/CSS
au BufNewFile,BufRead *.js,*.html,*.css
	\ set tabstop=2
	\ softtabstop=2
	\ shiftwidth=2

" Flag Unnecessary Whitespace
au BufNewFile,BufRead *.py, *.pyw, *.c, *.h, *.java match BadWhitespace /\s\+$/

