" 補全選單的開啟與關閉
set completeopt=longest,menu                    " 讓Vim的補全選單行為與一般IDE一致(參考VimTip1228)
let g:ycm_min_num_of_chars_for_completion=2             " 從第2個鍵入字元就開始羅列匹配項
let g:ycm_cache_omnifunc=0                      " 禁止快取匹配項,每次都重新生成匹配項
let g:ycm_autoclose_preview_window_after_completion=1       " 智慧關閉自動補全視窗
autocmd InsertLeave * if pumvisible() == 0|pclose|endif         " 離開插入模式後自動關閉預覽視窗
"
" 補全選單中各項之間進行切換和選取：預設使用tab  s-tab進行上下切換，使用空格選取。可進行自定義設定：
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
"let g:ycm_key_list_select_completion=['<c-n>']
"let g:ycm_key_list_select_completion = ['<Down>']      " 通過上下鍵在補全選單中進行切換
"let g:ycm_key_list_previous_completion=['<c-p>']
"let g:ycm_key_list_previous_completion = ['<Up>']
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
" 回車即選中補全選單中的當前項
" 開啟各種補全引擎
let g:ycm_collect_identifiers_from_tags_files=1         " 開啟 YCM 基於標籤引擎
let g:ycm_auto_trigger = 1                  " 開啟 YCM 基於識別符號補全，預設為1
let g:ycm_seed_identifiers_with_syntax=1                " 開啟 YCM 基於語法關鍵字補全
let g:ycm_complete_in_comments = 1              " 在註釋輸入中也能補全
let g:ycm_complete_in_strings = 1               " 在字串輸入中也能補全
let g:ycm_collect_identifiers_from_comments_and_strings = 0 " 註釋和字串中的文字也會被收入補全
" 重對映快捷鍵
"上下左右鍵的行為 會顯示其他資訊,inoremap由i 插入模式和noremap不重對映組成，只對映一層，不會對映到對映的對映
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
"nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>           " force recomile with syntastic
"nnoremap <leader>lo :lopen<CR>    "open locationlist
"nnoremap <leader>lc :lclose<CR>    "close locationlist
"inoremap <leader><leader> <C-x><C-o>
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
 " 跳轉到定義處
let g:ycm_confirm_extra_conf=1                  " 關閉載入.ycm_extra_conf.py確認提示
