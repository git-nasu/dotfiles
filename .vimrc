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

"Esc remapping...
noremap <C-j> <esc>
noremap! <C-j> <esc>

"Comment Color Change

hi Comment ctermfg=2

"____________________________________________________________________

"Coc Nvim Color Modified

highlight Pmenu      cterm=none   ctermbg=236  ctermfg=none
highlight PmenuSel   cterm=none   ctermbg=24   ctermfg=none

"____________________________________________________________________



"dein vim settings

if &compatible
  set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  
  call dein#load_toml('~/.vim/dein.toml',{'lazy': 0})
  "call dein#load_toml('~/.vim/dein_lazy.toml,{'lazy': 1})
  
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on

if dein#check_install()
  call dein#install()
endif

"____________________________________________________________________

"emmet-vim snippet
"
let g:user_emmet_settings = {
      \  'variables' : {
      \    'lang' : "en"
      \  },
      \  'html' : {
      \    'indentation' : '  ',
      \    'snippets' : {
      \      'html:5': "<!DOCTYPE html>\n"
      \        ."<html lang=\"${lang}\">\n"
      \        ."<head>\n"
      \        ."\t<meta charset=\"${charset}\">\n"
      \        ."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n"
      \        ."\t<link rel=\"stylesheet\" href=\"./index.css\">\n"
      \        ."\t<link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css\">\n"
      \        ."\t<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css\">\n"
      \        ."\t<script src=\"\"></script>\n"
      \        ."\t<title></title>\n"
      \        ."</head>\n"
      \        ."<body>\n\t${child}|\n</body>\n"
      \        ."</html>",
      \    }
      \  }
      \}

"____________________________________________________________________


"vim-airline settings
"
set laststatus=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_idx_mode=1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.crypt  = '🔒'


"____________________________________________________________________

"added crtlp.vim settings
"
"
set wildignore+=*/tmp/*,*.so,*.swp,*.Zip,*/vendor/*,*/\.git/*
let g:ctrlp_custom_ignore = 'tmp$\|\.git$\|\.hg$\|\.svn$\|.rvm$\|.bundle$\|vendor'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=25 
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlink=1
let g:ctrlp_use_caching=1
let g:ctrlp_clear_cache_on_exit=0
"Most Recently Used Files
let g:ctrlp_cmd = 'CtrlPMRUFiles'
