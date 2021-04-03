vnoremap <Leader>hrh :call ToSymbolHashSelection()<cr>
noremap <Leader>hrh :call ToSymbolHash()<cr>
vnoremap <Leader>hh :call ToHashSelection()<cr>
nnoremap <Leader>hh :call ToHash()<cr>
vnoremap <Leader>hs :call ToStrSelection()<cr>
nnoremap <Leader>hs :call ToStr()<cr>

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
