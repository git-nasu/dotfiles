"pubic settings .vimrc
set fenc=utf-8
set nobackup
set noswapfile
set showcmd
set autoread
set hidden

"apperance
"
set number
set virtualedit=onemore
set smartindent
set laststatus=2
nnoremap j gj
nnoremap k gk
syntax enable


"tab
"
set expandtab
set tabstop=2
set shiftwidth=2


"searching
"
set ignorecase
set incsearch
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"Comment Color Change

hi Comment ctermfg=2


"dein vim settings

if &compatible
  set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  
  call dein#load_toml('~/.vim/dein.toml',{'lazy': 0})
  
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on

if dein#check_install()
  call dein#install()
endif
