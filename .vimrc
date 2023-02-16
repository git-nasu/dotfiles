"pubic settings .vimrc set fenc=utf-8 version: 3 set nobackup
set noswapfile
set showcmd
set autoread
set autowrite 
set hidden

"apperance
set number 
set virtualedit=onemore
set smartindent
set autoindent
set laststatus=2
nnoremap j gj
nnoremap k gk
syntax enable

"tab
set expandtab
set tabstop=2
set shiftwidth=2

"searching
set noignorecase
set incsearch
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"undo persistent
if has('persistent_undo')
  let undo_path = expand('~/.vimrc/undo')
  exe 'set undodir=' .. undo_path
  set undofile
endif

"back to normal mode
inoremap <silent> jj <Esc>


"Comment Color Change
hi Comment ctermfg=2

"quote highlight color modified
hi MatchParen cterm=bold ctermbg=none ctermfg=green

"__________________________________________________________________
"vim_jsx_pretty settings

let g:vim_jsx_pretty_colorful_config = 1

"-------------------------------------------------------------------
"con nvim hightlight color modified

hi Pmenu cterm=none ctermbg=236 ctermfg=none
hi Pmenusel cterm=none ctermbg=24 ctermfg=none

"coc nvim autocompletions
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col-1] =~ '\s'
endfunction

inoremap <silent><expr> <Enter> coc#pum#visible() ? coc#pum#confirm() : "\<Enter>"
inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#pum#next(1):
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? con#pum#prev(1) : "\<S-TAB>" " "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()


"____________________________________________________________________
"emmet-vim snippet

let g:taglong_verbose = 1
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
      \        ."\t<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net.npm/bootstrap@5.0.2/dist/css/bootstrap.min.css\">\n"
      \        ."\t<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css\">\n"
      \        ."\t<script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js\"></script>\n"
      \        ."\t<title></title>\n"
      \        ."</head>\n"
      \        ."<body>\n\t${child}|\n</body>\n"
      \        ."</html>",
      \    }
      \  }
      \}

"____________________________________________________________________
"vim-airline settings

set laststatus=1
let g:airline#extensions#tabline#enabled=1

let g:airline#extensions#default#layout = [
   \ ['a', 'b', 'c'],
   \ ['z']
   \ ]
let g:airline_section_c = '%t %M'
let g:airline_section_z = get(g:, 'airline_linecolumn_prefix', '').'%3l:%-2v' "z section display line/column

"tabline display modified
let g:airline#extensions#tabline##fnamemod = ':t'
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#show_close_button = 0

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.crypt  = '🔒'



"____________________________________________________________________
"fern-vim settings

nnoremap <C-n> :Fern . -reveal=% -drawer -toggle -width=40<CR>

"added crtlp.vim settings
"____________________________________________________________________
set wildignore+=*/tmp/*,*.so,*.swp,*.Zip,*/vendor/*,*/\.git/*
let g:ctrlp_custom_ignore = 'tmp$\|\.git$\|\.hg$\|\.svn$\|.rvm$\|.bundle$\|vendor'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=25 
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlink=1
let g:ctrlp_use_caching=1
let g:ctrlp_user_command = [ 
      \ [ '.git', 'git -C "%s" ls-files' ]
      \]
let g:ctrlp_clear_cache_on_exit=0
"Most Recently Used Files
let g:ctrlp_cmd = 'CtrlPMRUFiles'




"vim-plug settings
"____________________________________________________________________

call plug#begin('~/.vim/plugged')
  Plug 'neoclide/coc.nvim',{'branch': 'release'} "language-server-protocol
  Plug 'tpope/vim-surround' "text object extensions plug
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'mattn/emmet-vim'
  Plug 'kien/ctrlp.vim' "fuzzy finder
  Plug 'lambdalisue/fern.vim' "filer
  Plug 'othree/html5.vim'
  Plug 'hail2u/vim-css3-syntax' "html5 css codesyntax
  Plug 'alvan/vim-closetag' "html tag auto close
  Plug 'tomasr/molokai'
  Plug 'cohama/lexima.vim'
  Plug 'maxmellon/vim-jsx-pretty', {'for': ['javascript','javascript.jsx']}
  Plug 'yuezk/vim-js' "with vim-jsx-pretty
  Plug 'tpope/vim-fugitive' "vim git
  Plug 'stephpy/vim-yaml' "yaml file indent
  Plug 'elel-dev/vim-astro-syntax' "astro syntax"
  Plug 'prettier/vim-prettier',{ 'do': 'yarn install','for': ['javascript', 'typescript','css','less','scss', 'json', 'graphql', 'markdown', 'jsx','vue', 'yaml', 'html'] }
call plug#end()
"_____________________________________________________________________



"vim-closetag settings
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.erb,*.php,*.js,*.jsx,*.astro,*.vue,*.py'




"Fern settings ctrl + n  display filer  or not filer
nnoremap <C-n> :Fern . -reveal=% -drawer -toggle -width=35<CR>
"autocmd FileType javascript  nested Fern . -reveal=% -drawer



"vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s: restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()





