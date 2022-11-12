-- global variable

local set = vim.opt

-- global config
vim.cmd [[
  syntax enable
  filetype plugin indent on
]]


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
set.background = 'light'

vim.g['python3_host_prog'] = '/usr/local/bin/python3'

-- from https://github.com/nvim-tree/nvim-tree.lua
-- disable netrw at the very start of your init.lua (strongly advised)
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
-- set termguicolors to enable highlight groups
-- vim.opt.termguicolors = true

-- end of global config
--

require('plugins')
require('keymap')

