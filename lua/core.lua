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
-- set.colorcolumn = 121
set.expandtab = true

vim.g['python3_host_prog'] = '/usr/local/bin/python3'



