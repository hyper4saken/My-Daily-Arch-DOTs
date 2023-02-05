-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use { "ellisonleao/gruvbox.nvim" }
  use { "nvim-lualine/lualine.nvim" }
  use { "jiangmiao/auto-pairs" }
  
  -- tmux & split window navigation
  use { "christoomey/vim-tmux-navigator" }
  use { "szw/vim-maximizer" } -- maximizes and restores current window

  -- essential plugins
  use { "tpope/vim-surround" }
  use { "vim-scripts/ReplaceWithRegister" }

  -- commenting with gc
  use { "numToStr/Comment.nvim" }

  -- autocompletion
  use { "hrsh7th/nvim-cmp" }
  use { "hrsh7th/cmp-buffer" }
  use { "hrsh7th/cmp-path" }

  -- snippets
  use { "L3MON4D3/LuaSnip" }
  use { "saadparwaiz1/cmp_luasnip" }
  use { "rafamadriz/friendly-snippets" }

  end)
