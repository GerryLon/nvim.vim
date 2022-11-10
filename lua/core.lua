-- global variable

local set = vim.opt


-- global config
vim.g.mapleader = ','

set.number = true 
set.encoding = 'utf-8'
set.showmatch = true
set.shiftwidth = 2
set.tabstop = 2
set.hlsearch = true
set.autoindent = true
set.clipboard = 'unnamed'
-- set.nocursorcolumn = true
set.cursorcolumn = false
set.cursorline = true
set.backspace = 'indent,eol,start'
set.ignorecase = true
set.smartcase = true
set.wildmenu = true
set.fixeol = true
-- set.colorcolumn = 120
set.expandtab = true

vim.g['python3_host_prog'] = '/usr/local/bin/python3'



-- plugin
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.vim/plugged')
--""""""""""""""""""""
--      Plugins      "
--""""""""""""""""""""
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'fatih/vim-go'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
-- Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug ('neoclide/coc.nvim', {branch='release'})
Plug 'dense-analysis/ale'
Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'
Plug '/usr/local/opt/fzf'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/gv.vim'
Plug 'junegunn/fzf.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'fatih/molokai'
Plug 'tpope/vim-fugitive'
Plug 'voldikss/vim-floaterm'
Plug 'airblade/vim-gitgutter'
Plug 'zivyangll/git-blame.vim'
-- Plug 'mg979/vim-visual-multi'
-- Plug 'gcmt/wildfire.vim'
-- Plug 'altercation/vim-colors-solarized'
-- Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'buoto/gotests-vim'
Plug 'NLKNguyen/papercolor-theme'
-- Plug 'ybian/smartim'
-- Plug 'github/copilot.vim'

vim.call('plug#end')
