
augroup filetype_markdown
    autocmd!
    autocmd FileType markdown onoremap ih :<c-u>execute "normal! ?^[{==}{\\-\\-}]\\+$\r:nohlsearch\rkvg_"<cr>
augroup END
