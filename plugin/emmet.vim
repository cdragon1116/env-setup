" enable Emmet only in HTML and CSS files
let g:user_emmet_leader_key=','
let g:user_emmet_install_global = 0
autocmd FileType html,css,scss,jsx,erb,javascript,eruby EmmetInstall
set syntax=javascript.jsx
