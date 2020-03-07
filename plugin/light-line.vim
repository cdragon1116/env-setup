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
