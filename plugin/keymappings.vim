"--------------
" key mapping
"-------------- " disable arrow keys
noremap <UP> <NOP>
noremap <DOWN> <NOP>
noremap <LEFT> <NOP>
noremap <RIGHT> <NOP>
inoremap <UP> <NOP>
inoremap <DOWN> <NOP>
inoremap <LEFT> <NOP>
inoremap <RIGHT> <NOP>

" previous and next buffer
noremap [b :bp<Enter>
noremap ]b :bn<Enter>

" vim-rspec mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" auto delete white space when save
autocmd BufWritePre * %s/\s\+$//e
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
noremap <F1> :set list!<CR>

" tab navigation
nnoremap H gT
nnoremap L gt
noremap j gj
noremap k gk

" move line up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" disable Q
nnoremap Q @@

" 換行
noremap <Enter> o<ESC>
noremap <S-Enter> O<ESC>

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

nnoremap <silent> == :vertical resize +5<CR>
nnoremap <silent> -- :vertical resize -5<CR>
nnoremap <silent> ++ :resize +5<CR>
nnoremap <silent> __ :resize -5<CR>

" relative path  (src/foo.txt)
nnoremap <leader>f :let @*=expand("%")<CR>
" absolute path  (/something/src/foo.txt)
nnoremap <leader>ff :let @*=expand("%:p")<CR>
" filename       (foo.txt)
nnoremap <leader>ct :let @*=expand("%:t")<CR>
" directory name (/something/src)
nnoremap <leader>ch :let @*=expand("%:p:h")<CR>

" esc in insert mode
inoremap jk <esc>
" esc in command mode
cnoremap jk <C-C>

"--------------
" tmux mapping
"--------------

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
      "
      "
      "
