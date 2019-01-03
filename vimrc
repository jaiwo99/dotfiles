" Set compatibility to Vim only.
set nocompatible

" Encoding
scriptencoding utf-8
set encoding=utf-8

" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

" Turn on syntax highlighting.
syntax on

" For plug-ins to load correctly.
filetype plugin indent on

" Turn off modelines
set modelines=0

" Automatically wrap text that extends beyond the screen length.
set wrap
" Vim's auto indentation feature does not work properly with text copied from outisde of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

" Uncomment below to set the max textwidth. Use a value corresponding to the width of your screen.
" set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5
" Fixes common backspace problems
set backspace=indent,eol,start

" Speed up scrolling in Vim
set ttyfast

" Status bar
set laststatus=2

" Display options
set showmode
set showcmd

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Display different types of white spaces.
scriptencoding utf-8
set encoding=utf-8

" Show line numbers
set number

" Set status line display
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

" Highlight matching search patterns
set hlsearch
" Enable incremental search
set incsearch
" Include matching uppercase words with lowercase search term
set ignorecase
" Include only uppercase words with uppercase search term
set smartcase

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

" Map the <Space> key to toggle a selected fold opened/closed.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Automatically save and load folds
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview"

" fzf config
set rtp+=/usr/local/opt/fzf

" Plugins
call plug#begin('~/.vim/plugged')

"Fugitive Vim Github Wrapper
Plug 'tpope/vim-fugitive'

"Fuzzy search
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

"Status bar
Plug 'itchyny/lightline.vim'

" Multiple cursor
Plug 'terryma/vim-multiple-cursors'

" Surround
Plug 'tpope/vim-surround'

" File tree
Plug 'scrooloose/nerdtree'

" Cursor
Plug 'wincent/terminus'

" Bash support
Plug 'vim-scripts/bash-support.vim'

" Supertab
Plug 'ervandew/supertab'

" Search completion
Plug 'vim-scripts/SearchComplete'

" Markdown support
Plug 'junegunn/vim-xmark', { 'do': 'make' }

" https://github.com/liuchengxu/space-vim-dark
Plug 'liuchengxu/space-vim-dark'

" https://github.com/arcticicestudio/nord-vim
Plug 'arcticicestudio/nord-vim'

call plug#end()

" Customized Config
" NERDTree config
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-o> :NERDTreeToggle<CR>

colorscheme nord

if !exists("macvim_skip_colorscheme") && !exists("colors_name")
  color space-vim-dark
  set termguicolors
  hi LineNr ctermbg=NONE guibg=NONE
endif
