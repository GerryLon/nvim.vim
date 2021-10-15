
" vim-airline 配置
" 
let g:airline#extensions#tabline#enabled=1 "顶部tab显示"
" let g:airline_powerline_fonts=1

let g:airline#extensions#tabline#show_splits = 1 "enable/disable displaying open splits per tab (only when tabs are opened). >
let g:airline#extensions#tabline#show_buffers = 1 " enable/disable displaying buffers with a single tab
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number

" let g:airline_theme='simple'
let g:airline_theme='bubblegum'

"设置tab键映射"
nmap <tab> :bn<cr> 
