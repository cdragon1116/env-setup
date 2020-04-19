" FZF
" set -gx FZF_DEFAULT_COMMAND  'rg --files --no-ignore-vcs --hidden'
" set -gx FZF_DEFAULT_COMMAND  'ag -g --hidden ""'

command! -bang Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

command! -bang -nargs=? -complete=dir Ag
  \ call fzf#vim#ag(<q-args>, fzf#vim#with_preview(), <bang>0)

" command! -bang -nargs=* Ag
" \ call fzf#vim#ag('ag -g ""',
" \                 <bang>0 ? fzf#vim#with_preview('up:60%')
" \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
" \                 <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \   <bang>0)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:50%'), <bang>0)


function! s:changebranch(branch)
    execute 'Git checkout' . a:branch
    call feedkeys("i")
endfunction

command! -bang Gbranch call fzf#run({
            \ 'source': 'git branch -a --no-color | grep -v "^\* " ',
            \ 'sink': function('s:changebranch')
            \ })


" FZF
" let l:fzf_files_options = '--preview "bat --theme="ansi-dark" --style=numbers,changes --color always {2..-1} | head -'.&lines.'"'
" let g:fzf_buffers_jump = 1
map <c-u> :Files <Enter>
map <c-i> :Ag <Enter>

nnoremap <leader>q :exe 'Ag!' expand('<cword>')<cr>
" nnoremap <leader>q
  " \ :call fzf#vim#ag('.', fzf#vim#with_preview({'options': ['--query', expand('<cword>')]}))<cr>

