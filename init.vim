set number
set encoding=utf-8
" set keep-english-in-normal
" set langmenu=zh_CN.UTF-8
"防止特殊符号无法正常显示
" set ambiwidth=double 
filetype plugin indent on
set showmatch
set shiftwidth=2
set tabstop=2
set encoding=utf-8
set hlsearch
set autoindent
set clipboard=unnamed
set nocursorcolumn              " Do not highlight column (speeds up highlighting)
" set nocursorline
set cursorline
" hi CursorLine term=bold ctermbg=yellow cterm=bold guibg=Grey40
" hi CursorLine ctermbg=yellow guibg=Grey40
set backspace=2
set ignorecase
set smartcase
set wildmenu
set fixeol
" set showcmd
" set relativenumber
" 超过120提示
set colorcolumn=120
set expandtab

" 创建一个新的 MyTabSpace 组,并设置它的颜色
highlight MyTabSpace guifg=darkgrey ctermfg=darkgrey
" 指定tab字符和空格的颜色组为MyTabSpace,不同字符串之间用|隔开,要使用\|转义.
match MyTabSpace /\t\| /
" match MyTabSpace / /
" 针对特定类型的代码文件,设置显示Tab键和行尾空格以便在查看代码时注意到它们
autocmd FileType python,sh,proto,yaml setlocal list | set listchars=tab:>~,trail:♫


" 自动加载文件
set autoread
au CursorHold * checktime

" 映射快捷键, 保存/退出
nnoremap S :w<CR>
nnoremap Q :q<CR>

call plug#begin('~/.vim/plugged')
"""""""""""""""""""""
"      Plugins      "
"""""""""""""""""""""
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'fatih/vim-go'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'
Plug '/usr/local/opt/fzf'
Plug 'jiangmiao/auto-pairs'
" Plug 'junegunn/gv.vim'
Plug 'junegunn/fzf.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'fatih/molokai'
Plug 'tpope/vim-fugitive'
Plug 'voldikss/vim-floaterm'
Plug 'airblade/vim-gitgutter'
Plug 'zivyangll/git-blame.vim'
Plug 'mg979/vim-visual-multi'
" Plug 'gcmt/wildfire.vim'
Plug 'altercation/vim-colors-solarized'
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'buoto/gotests-vim'
Plug 'NLKNguyen/papercolor-theme'
" Plug 'ybian/smartim'
" Plug 'github/copilot.vim'
call plug#end()

" Enable to copy to clipboard for operations like yank, delete, change and put
" http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
if has('unnamedplus')
  set clipboard^=unnamed
  set clipboard^=unnamedplus
endif

" This enables us to undo files even if you exit Vim.
if has('persistent_undo')
  set undofile
  set undodir=~/.config/vim/tmp/undo//
endif

" Colorscheme
syntax enable
set t_Co=256
let g:rehash256 = 1
let g:molokai_original = 1
let g:solarized_termcolors=256
 " set background=dark
set background=light
" colorscheme solarized
colorscheme PaperColor
" colorscheme molokai


" Set leader shortcut to a comma ','. By default it's the backslash
let mapleader = ','


" vim-go
let g:go_fmt_command = 'gofmt'
let g:go_autodetect_gopath = 1
" let g:go_bin_path = '$GOBIN'

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'


" Open :GoDeclsDir with ctrl-g
nmap <silent> <C-g> :GoDeclsDir<CR>
imap <silent> <C-g> <esc>:<C-u>GoDeclsDir<CR>

augroup go
  autocmd!
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=2 shiftwidth=2
augroup END

" build_go_files is a custom function that builds or compiles the test file.
" It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" map <leader>fzf :Files<CR>
noremap <C-f> :Files<CR>
noremap  <Space><Space> :Files<CR>
inoremap <C-f> :Files<CR>
map <leader>fzb :Buffers<CR>
let g:fzf_action = { 'ctrl-e': 'edit' }
" 用 leader+ag 搜索当前 cursor 下单词 see: https://github.com/junegunn/fzf.vim/issues/50
" nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>
nnoremap <silent> <leader>ag :Ag <CR>
" noremap <C-a> :Ag<CR>
" noremap <leader>a :Ag<CR>

nnoremap <leader>v :NERDTreeFind<cr>
nnoremap <leader>g :NERDTreeToggle<cr>
" nnoremap <C-f> :NERDTreeFind<CR>

nnoremap <leader>t :TagbarToggle<cr>
nmap ss <Plug>(easymotion-s2)
nmap mm <Plug>(easymotion-s2)

" 定义floaterm快捷键
" let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_new = '<Leader>ft'


" ale-setting {{{
let g:ale_set_highlights = 1
let g:ale_set_quickfix = 1
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"打开文件时不进行检查
let g:ale_lint_on_enter = 1

"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
" nmap <Leader>l :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>
let g:ale_linters = {
    \ 'go': ['golint', 'go vet', 'go fmt'],
	\ 'python': ['flake8', 'pylint'],
	\ 'rust': ['cargo'],
    \ }

" Remap keys for gotos
" nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gm <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nnoremap <silent> K :call <SID>show_document()<CR>
function! s:show_document()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Jump to next error with Ctrl-n and previous error with Ctrl-m. Close the
" quickfix window with <leader>a
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" for git blame
nnoremap <leader>gb :<C-u>call gitblame#echo()<CR>


source $HOME/.config/nvim/vim-airline.vim
source $HOME/.config/nvim/vim-markdown-preview.vim
source $HOME/.config/nvim/python.vim

" windows size control
nnoremap  <leader>5> <C-w>5>
nnoremap  <leader>5< <C-w>5<
nnoremap  <leader>5+ <C-w>5+
nnoremap  <leader>5- <C-w>5-


" go debug
nnoremap gds :GoDebugStep<CR>
nnoremap gdn :GoDebugNext<CR>
nnoremap gdb :GoDebugBreakpoint<CR>

" for c/cpp
let g:ale_linters = {
\   'cpp': ['g++'],
\   'c': ['gcc'],
\   'python': ['pylint'],
\   'go': ['golint'],
\}
