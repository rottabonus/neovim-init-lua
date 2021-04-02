local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
    'savq/melange',
    config = 'vim.cmd[[colo melange]]'
  }
  use 'justinmk/vim-dirvish'
  use 'mhinz/vim-startify'
  use 'junegunn/goyo.vim'

  use 'tpope/vim-eunuch'
  use 'tpope/vim-rsi'
  use 'tpope/vim-abolish'
  use 'tpope/vim-fugitive'

  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    config = function() vim.cmd [[
      nnoremap <leader>ff <cmd>Telescope find_files<cr>
      nnoremap <leader>fg <cmd>Telescope live_grep<cr>
      nnoremap <leader>fb <cmd>Telescope buffers<cr>
      nnoremap <leader>fh <cmd>Telescope help_tags<cr>
      nnoremap <leader>fq <cmd>Telescope quickfix<cr>
      nnoremap <leader>fm <cmd>Telescope marks<cr>
      nnoremap ; <cmd>Telescope git_files<cr>
    ]]
    end
  }
end)
