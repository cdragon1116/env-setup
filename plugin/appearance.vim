"--------------
" appearance
"--------------
set number             " show line number
set noshowmode         " disable mode(because of Vim-Airline)
set showcmd            " display command
set nolist             " do not display invisible characters
set wrap
set linebreak
set cursorline
set ruler
set showtabline=0
set shortmess=I       " remove splash wording
set equalalways       " split windows are always equal size
set nospell

"--------------
" split window
"--------------
set splitbelow
set splitright

"--------------
" Scroll
"--------------
set scrolloff=10

"--------------
" Tab and space
"--------------
set softtabstop=2
set shiftwidth=2
set expandtab

"--------------
" ColorScheme
"--------------
set termguicolors
syntax on
colorscheme dracula
set background=dark

try
  set gfn=Monaco:h18
  set background=dark
  colorscheme dracula
catch
endtry

"--------------
" Sound
"--------------
"
" disable sound on errors
set visualbell
set noerrorbells
set t_vb=
set tm=500

set timeoutlen=1000
set ttimeoutlen=0
