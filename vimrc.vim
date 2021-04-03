" Plugins
" "--------------
call plug#begin('~/.vim/plugged')
  " for general purpose development
  Plug 'scrooloose/nerdtree'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'Yggdroot/indentLine'

  Plug 'tpope/vim-surround'
  Plug 'jiangmiao/auto-pairs'
  " Plug 'scrooloose/nerdcommenter'
  Plug 'preservim/nerdcommenter'
  " Plug 'MarcWeber/vim-addon-mw-utils'
  " Plug 'tomtom/tlib_vim'
  Plug 'majutsushi/tagbar'

  " git development
  Plug 'tpope/vim-fugitive'
  Plug 'ruanyl/vim-gh-line'
  Plug 'airblade/vim-gitgutter'

  " style
  Plug 'KabbAmine/yowish.vim'
  Plug 'morhetz/gruvbox'
  Plug 'itchyny/lightline.vim'

  " tmunx
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'edkolev/tmuxline.vim'

  " snippet and complete
  Plug 'SirVer/ultisnips'
  Plug 'ervandew/supertab'
  Plug 'Valloric/YouCompleteMe'
  Plug 'honza/vim-snippets'

  " searching
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'justinmk/vim-gtfo'

  " for ruby/rails development
  Plug 'vim-ruby/vim-ruby'
  Plug 'tpope/vim-rails'
  " Plug 'thoughtbot/vim-rspec'
  Plug 'w0rp/ale'
  " Plug 'ngmy/vim-rubocop'

  " for react/js development
  Plug 'mattn/emmet-vim'
  Plug 'pangloss/vim-javascript'
  Plug 'MaxMEllon/vim-jsx-pretty'
  Plug 'Valloric/MatchTagAlways'
  Plug 'alvan/vim-closetag'

call plug#end()

"--------------
" Settings
"--------------
" set shell=zsh
" set shellcmdflag=-ic
set nocompatible
set clipboard=unnamed
set noswapfile
set hidden
set nobomb
set noswapfile

" git gutter
set updatetime=100
set signcolumn=yes

set smartindent
set smarttab
set backspace=indent,eol,start

" search
set hlsearch
set ignorecase
set smartcase
set incsearch

" copy paste
set clipboard+=unnamed  " use the clipboards of vim and win
set pastetoggle=<F10>
set go+=a               " Visual selection automatically copied to the clipboard
set lazyredraw


"--------------
"Filetype and Encoding
"--------------

filetype on
filetype indent on
filetype plugin on

" file encoding
set encoding=utf-8
scriptencoding utf-8


"--------------
" key mapping
"--------------
" .vim/plugin/keymappings.vim

"--------------
" other settings
"--------------

" comment add space
let NERDSpaceDelims=1

"tmux
let g:airline#extensions#tmuxline#enabled = 1
let g:tmuxline_powerline_separators = 0

" close tag settings
let g:closetag_filetypes = 'html,xhtml,phtml,javascript.jsx,eruby'

"indent line
let g:indentLine_color_term = 239

"jumping window on
autocmd VimEnter * wincmd w

" git hi
hi GitGutterAdd guibg=red guifg=green

"--------------
" note
"--------------
"
" note
" "*P
" :read !pbpaste
" bash$ pbpaste | vim -


function! Pphash()
  execute "set filetype=ruby"
  " split {} []
  execute ":%s/[{[]/&\r/g"
  execute ":%s/[]}]/\r&/g"

  execute ":%s/\s*=>\s*/: /g"
  " split new line on , and remove blank line
  execute ":%s/,/,\r/g"
  execute "g/^$/d"
  execute ":normal! gg=G"
endfunction

function! Pphashv()
  execute "set filetype=ruby"
  " split {} []
  execute ":s/[{[]/&\r/g"
  execute ":s/[]}]/\r&/g"

  execute ":s/\s*=>\s*/: /g"
  " split new line on , and remove blank line
  execute ":s/,/,\r/g"
  execute "g/^$/d"
endfunction

function! ToHash()
  silent!
  silent! %s/[{[]/&\r/g
  silent! %s/[]}]/\r&/g
  silent! %s/\s*=>\s*/: /g
  silent! %s/,/,\r/g
  silent! g/^\s*$/d
  set filetype=ruby
  normal! gg=G
endfunction

function! ToSymbolHash()
  silent!
  silent! %s/[{[]/&\r/g
  silent! %s/[]}]/\r&/g
  silent! %s/\s*=>\s*/: /g
  silent! %s/,/,\r/g
  silent! g/^\s*$/d
"   silent! %s/\("\)\([^"]*\)\("\)/\2/
  silent! %s/\("\)\([^"]*\)\("\)\s*\(=>\|:\)/\2:/
  set filetype=ruby
  normal! gg=G
endfunction

function! ToSymbolHashSelection()
  execute "normal! vi)\<Esc>"
  silent! '<,'>s/[{[]/&\r/g
  silent! '<,'>s/[]}]/\r&/g
  silent! '<,'>s/\s*=>\s*/: /g
"   silent! '<,'>s/\("\)\([^"]*\)\("\)/\2/
  silent! '<,'>s/\("\)\([^"]*\)\("\)\s*\(=>\|:\)/\2:/
  silent! '<,'>s/,/,\r/g
  set filetype=ruby
  normal! gg=G
endfunction

function! ToHashSelection()
  execute "normal! vi)\<Esc>"
  silent! '<,'>s/[{[]/&\r/g
  silent! '<,'>s/[]}]/\r&/g
  silent! '<,'>s/\s*=>\s*/: /g
  silent! '<,'>s/,/,\r/g
  silent! g/^\s*$/d
  set filetype=ruby
  normal! gg=G
endfunction

nnoremap Q @@
vnoremap <Leader>hrh :call ToSymbolHashSelection()<cr>
noremap <Leader>hrh :call ToSymbolHash()<cr>
vnoremap <Leader>hh :call ToHashSelection()<cr>
nnoremap <Leader>hh :call ToHash()<cr>
vnoremap <Leader>hs :call ToStrSelection()<cr>
nnoremap <Leader>hs :call ToStr()<cr>

function! ToStr()
  silent!
  silent! %s/\([{[]\)\(.\+\)/\1\r\2/g
  silent! %s/\(.\+\)\([]}]\)/\1\r\2/g
  silent! %s/"*\(\w\+\)"*:\s*/"\1" => /g
  silent! %s/,/,\r/g
  silent! g/^\s*$/d
  set filetype=ruby
  normal! gg=G
endfunction

function! ToStrSelection()
  execute "normal! vi)\<Esc>"
  silent! '<,'>s/[{[]/&\r/g
  silent! '<,'>s/[]}]/\r&/g
  silent! '<,'>s/"*\(\w\+\)"*:\s*/"\1" => /g
  silent! '<,'>s/,/,\r/g
  silent! g/^\s*$/d
  set filetype=ruby
  normal! gg=G
endfunction

set timeoutlen=1000
set ttimeoutlen=0

autocmd FileType erb let b:surround_{char2nr('=')} = "<%= \r %>"
autocmd FileType erb let b:surround_{char2nr('-')} = "<% \r %>"

set tags=tags
