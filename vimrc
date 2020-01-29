" Plugins "--------------
call plug#begin('~/.vim/plugged')
  Plug 'itchyny/lightline.vim'
  Plug 'edkolev/tmuxline.vim'
  Plug 'scrooloose/nerdtree'
  " Plug 'ctrlpvim/ctrlp.vim'
  Plug 'mattn/emmet-vim'


  Plug 'terryma/vim-multiple-cursors'
  Plug 'Yggdroot/indentLine'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'

  " for general purpose development
  Plug 'MarcWeber/vim-addon-mw-utils'
  Plug 'tomtom/tlib_vim'
  Plug 'majutsushi/tagbar'
  Plug 'airblade/vim-gitgutter'

  " Custom
  Plug 'jiangmiao/auto-pairs'
  Plug 'scrooloose/nerdcommenter'

  " style
  Plug 'KabbAmine/yowish.vim'

  " snippet and complete
  Plug 'SirVer/ultisnips'
  Plug 'ervandew/supertab'
  Plug 'Valloric/YouCompleteMe'
  Plug 'honza/vim-snippets'
  Plug 'junegunn/fzf.vim'
  Plug '/usr/local/opt/fzf'

  " for ruby/rails development
  Plug 'vim-ruby/vim-ruby'
  Plugin 'vim-ruby/vim-ruby'
  Plug 'tpope/vim-rails'
  Plug 'thoughtbot/vim-rspec'
  "Plug 'dense-analysis/ale'
  Plug 'w0rp/ale'
  Plug 'ngmy/vim-rubocop'

  " for react/js development
  Plug 'pangloss/vim-javascript'
  " Plug 'mxw/vim-jsx'
  Plug 'MaxMEllon/vim-jsx-pretty'
  Plug 'Valloric/MatchTagAlways'
  Plug 'alvan/vim-closetag'

  " tmux
  Plugin 'christoomey/vim-tmux-navigator'

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
set nobomb            " no BOM(Byte Order Mark)
" set guifont=Menlo\ Regular:h30
set noswapfile


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


" comment add space
let NERDSpaceDelims=1


" relative path  (src/foo.txt)
nnoremap <leader>f :let @*=expand("%")<CR>
" absolute path  (/something/src/foo.txt)
nnoremap <leader>ff :let @*=expand("%:p")<CR>
" filename       (foo.txt)
nnoremap <leader>ct :let @*=expand("%:t")<CR>
" directory name (/something/src)
nnoremap <leader>ch :let @*=expand("%:p:h")<CR>

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

"tmux
let g:airline#extensions#tmuxline#enabled = 1

let g:tmuxline_powerline_separators = 0

" vim-rspec mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" auto delete whiteeee space
autocmd BufWritePre * %s/\s\+$//e
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
noremap <F1> :set list!<CR>

" lightline settings
set laststatus=2

let g:lightline = {
      \ 'colorscheme': 'yowish',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name',
      \   'filename': 'LightLineFilename',
      \ },
      \ }

function! LightLineFilename()
  return expand('%')
endfunction


"------------------------


" erb
autocmd FileType erb let b:surround_{char2nr('=')} = "<%= \r %>"
autocmd FileType erb let b:surround_{char2nr('-')} = "<% \r %>"

" Enter to next line
noremap <Enter> o<ESC>
noremap <S-Enter> O<ESC>

" resize window
noremap <C-w>- :split<cr>
noremap <C-w>\ :vsplit<cr>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" nnoremap <silent> <Leader>= :vertical resize +5<CR>
" nnoremap <silent> <Leader>- :vertical resize -5<CR>
nnoremap <silent> == :vertical resize +5<CR>
nnoremap <silent> -- :vertical resize -5<CR>
nnoremap <silent> ++ :resize +5<CR>
nnoremap <silent> __ :resize -5<CR>
" map <silent> ˜ <C-w><C-w>
" map <silent> π <C-w><S-w>

" nnoremap <silent> <c-h> :call TmuxMove('h')<cr>
" nnoremap <silent> <c-j> :call TmuxMove('j')<cr>
" nnoremap <silent> <c-k> :call TmuxMove('k')<cr>
" nnoremap <silent> <c-l> :call TmuxMove('l')<cr>

" function! TmuxMove(direction)
        " let wnr = winnr()
        " silent! execute 'wincmd ' . a:direction
        " " If the winnr is still the same after we moved, it is the last pane
        " if wnr == winnr()
                " call system('tmux select-pane -' . tr(a:direction, 'phjkl', 'lLDUR'))
        " end
      " endfunction


" tab navigation
nnoremap H gT
nnoremap L gt
" 換行
noremap <Enter> o<ESC>
noremap <S-Enter> O<ESC>

" UltiSnips Trigger configuration
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" closetag settings
let g:closetag_filetypes = 'html,xhtml,phtml,javascript.jsx,eruby'

"indent line
let g:indentLine_color_term = 239

"jumping window on
autocmd VimEnter * wincmd w

