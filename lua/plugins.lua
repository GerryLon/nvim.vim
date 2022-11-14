-- plugins from vim-plug
local Plug = vim.fn['plug#']
local map = vim.api.nvim_set_keymap
-- local set = vim.opt

vim.call('plug#begin', '~/.vim/plugged')
--""""""""""""""""""""
--      Plugins      "
--""""""""""""""""""""
-- Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'fatih/vim-go'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
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

vim.cmd [[
  colorscheme PaperColor
]]


-- plugins from packer

-- auto install packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup({function(use)
  use 'wbthomason/packer.nvim'

  -- My plugins here
   use {
     "nvim-lualine/lualine.nvim",
     requires = {"kyazdani42/nvim-web-devicons", opt = true},
     config = function()
     end,
   }
  -- use {
  --   'nvim-telescope/telescope.nvim', tag = '0.1.0',
  -- -- or                            , branch = '0.1.x',
  --   requires = { {'nvim-lua/plenary.nvim'} }
  -- }
  -- use {
  --   'nvim-treesitter/nvim-treesitter',
  --   run = ':TSUpdate'
  -- }
  -- use {
  --   'nvim-treesitter/nvim-treesitter',
  --   run = function()
  --       local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
  --       ts_update()
  --   end,
  -- }
  -- use {
  --   'mfussenegger/nvim-dap',
  -- }
  -- use {
  --   'leoluz/nvim-dap-go',
  --   requires = {'mfussenegger/nvim-dap',},
  --   config = function() require('dap-go').setup() end
  -- }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end,
config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  },
  profile = {
    enable = true,
    threshold = 1 -- the amount in ms that a plugin's load time must be over for it to be included in the profile
  }
}})


---- from: https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation
-- for treesitter
---- vim.opt.foldmethod     = 'expr'
---- vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
-----WORKAROUND
--vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
--  group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
--  callback = function()
--    -- vim.opt.nofoldenable = true 
--    vim.opt.foldmethod     = 'expr'
--    vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
--  end
--})
-----ENDWORKAROUND

-- local telescope_builtin = require('telescope.telescope_builtin')
-- map('n', '<leader>ff', telescope_builtin.find_files, {noremap=true})
-- map('n', '<leader>fg', telescope_builtin.live_grep, {noremap=true})
-- map('n', '<leader>fb', telescope_builtin.buffers, {noremap=true})
-- map('n', '<leader>fh', telescope_builtin.help_tags, {noremap=true})


-- config for lualine
require('lualine').setup({
 options = { theme = 'dracula' },
 sections = {
   lualine_c = {{
     'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 3 -- 0 = just filename, 1 = relative path, 2 = absolute path
   }},
   lualine_x = {'encoding', {'fileformat', icons_enabled = false}, 'filetype'},
 },
}) 
