" Rubocop linters

let g:ale_linters_explicit = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
"
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'ruby': ['rubocop'],
\}

let g:ale_enabled = 1
let g:ale_fix_on_save = 0
let g:ale_set_highlights = 0
let g:ale_set_signs = 0

let g:vimrubocop_keymap = 0
nmap <Leader>r :RuboCop<CR>
