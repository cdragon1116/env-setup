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
"   Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
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
