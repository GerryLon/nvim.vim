require('plugins')
-- global variable

local set = vim.opt
local map = vim.api.nvim_set_keymap

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

local python_install_path = vim.fn.exepath('python3');

vim.g['python3_host_prog'] = python_install_path;

-- from https://github.com/nvim-tree/nvim-tree.lua
-- disable netrw at the very start of your init.lua (strongly advised)
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
-- set termguicolors to enable highlight groups
-- vim.opt.termguicolors = true

-- end of global config


-- key map
map('n', 'S', ':w<CR>', {noremap=true})
map('n', 'Q', ':q<CR>', {noremap=true})

