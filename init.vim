call plug#begin('~/.config/nvim/plugged')

" Make sure you use single quotes

" Status line
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/denite.nvim'
Plug 'ap/vim-buftabline'
Plug 'junegunn/vim-peekaboo'

" Colorschemes
Plug 'jnurmine/Zenburn'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'chriskempson/base16-vim'
Plug 'junegunn/seoul256.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'mkarmona/materialbox'
Plug 'owickstrom/vim-colors-paramount'
Plug 'vim-scripts/pyte'

" General programming
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'ternjs/tern_for_vim', { 'do': 'npm install -g tern' }
Plug 'w0rp/ale'
Plug 'garbas/vim-snipmate'
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tpope/vim-surround'
" Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-fugitive'

" Javascript plugins
Plug 'pangloss/vim-javascript'
Plug 'leshill/vim-json'

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
" set autochdir
set showmatch
set incsearch
set hlsearch
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
set scrolloff=3
set number

set clipboard^=unnamed,unnamedplus
set langmenu=en_US.UTF-8    " Sets menu language (gvim)
set encoding=utf-8
set termencoding=utf8

" Store temporary files
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" Allow backspacing in Insert Mode
set backspace=indent,eol,start
" Display incomplete commands
set showcmd
" Syntax highlighting
syntax on
" filetype detection
filetype plugin indent on
" Emacs-style tab completion
set wildmode=longest,list
set wildmenu

set background=light
colorscheme PaperColor

let g:buftabline_show=1
let g:buftabline_indicators=1
let g:buftabline_numbers=2

" python setup
" if WIN32
" let g:python3_host_prog='C:\Python36\python.exe'

" ALE
let g:ale_lint_on_save=1
let g:ale_lint_on_text_changed=0

" Neocomplete
let g:deoplete#enable_at_startup=1
if exists('g:plugs["tern_for_vim"]')
    let g:tern_show_argument_hints='on_hold'
    let g:tern_show_signature_in_pum=1
    autocmd FileType javascript setlocal omnifunc=tern#Complete
endif

" JavaScript plugins
let g:javascript_plugin_flow=1

" highlight BufTabLineCurrent guifg=#444444 guibg=#e4e4e4
" highlight BufTabLineActive guifg=#eeeeee guibg=#005faf
" highlight BufTabLineHidden guifg=#eeeeee guibg=#0087af
" highlight BufTabLineFill guibg=#005f87

" set leader to space bar
let mapleader="\<space>"

nmap <leader>1 <Plug>BufTabLine.Go(1)
nmap <leader>2 <Plug>BufTabLine.Go(2)
nmap <leader>3 <Plug>BufTabLine.Go(3)
nmap <leader>4 <Plug>BufTabLine.Go(4)
nmap <leader>5 <Plug>BufTabLine.Go(5)
nmap <leader>6 <Plug>BufTabLine.Go(6)
nmap <leader>7 <Plug>BufTabLine.Go(7)
nmap <leader>8 <Plug>BufTabLine.Go(8)
nmap <leader>9 <Plug>BufTabLine.Go(9)
nmap <leader>0 <Plug>BufTabLine.Go(10)

nnoremap <leader>n :bnext<CR>
nnoremap <leader>p :bprev<CR>
nnoremap <leader>d :bdelete<CR>

nnoremap <leader>b :ls<cr>:b<space>

" moving up down
nnoremap <C-J> <C-W>j<C-W>_
nnoremap <C-K> <C-W>k<C-W>_

nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l

nnoremap - <C-W><C-W>
nnoremap _ <C-W><C-W>
nnoremap + <C-S-W><C-S-W>

" Maps leader-[s,v] to horizontal and vertical split respectively
nnoremap <silent> <Leader>s :split<CR>
nnoremap <silent> <Leader>v :vsplit<CR>
nnoremap <silent> <Leader>c <C-W>c

" Maps leader-[h,l] for moving next and previous window respectively
nnoremap <silent> <Leader>h <C-w><C-w>
nnoremap <silent> <Leader>l <C-w><S-w>

" Maps Alt-[h,j,k,l] to resizing a window split
nnoremap <silent> <A-n> <C-w>5<
nnoremap <silent> <A-e> <C-W>3-
nnoremap <silent> <A-i> <C-W>3+
nnoremap <silent> <A-o> <C-w>5>


" Workaround ConEmu
" ConEmu fix for 256 colors in Vim
" and remaps for fixing Windows Vim's weird
" Backspace behavior
if !empty($ConEmuBuild)
    " echom "Running ConEmu settings"
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

au BufNewFile,BufRead *.css
	\ set tabstop=2
	\ softtabstop=2
	\ shiftwidth=2

au BufNewFile,BufRead *.html
	\ set tabstop=2
	\ softtabstop=2
	\ shiftwidth=2

au BufNewFile,BufRead *.js
	\ set tabstop=2
	\ softtabstop=2
	\ shiftwidth=2

" Flag Unnecessary Whitespace
au BufNewFile,BufRead *.py, *.pyw, *.c, *.h, *.java match BadWhitespace /\s\+$/

