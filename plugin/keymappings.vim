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

" auto delete white space when save
autocmd BufWritePre * %s/\s\+$//e
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
noremap <F1> :set list!<CR>

" tab navigation
nnoremap H gT
nnoremap L gt
noremap j gj
noremap k gk

" disable Q
nnoremap Q @@

" line break
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

nnoremap <F5> :call whichpr#open()<CR>

" vertical naviagtion
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz
" nnoremap <C-d> <C-d>zz
" nnoremap <C-u> <C-u>zz

xnoremap <leader>p "_dP


" run prettier
nnoremap gp :silent %!npx prettier --stdin-filepath %<CR>

