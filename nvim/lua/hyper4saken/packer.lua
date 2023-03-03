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
  -- use { "ellisonleao/gruvbox.nvim" }
  use { "folke/tokyonight.nvim" } --theme
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

  -- nvim tree
  use {
      'nvim-tree/nvim-tree.lua',
      requires = {
          'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v1.x',
      requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},             -- Required
          {'williamboman/mason.nvim'},           -- Optional
          {'williamboman/mason-lspconfig.nvim'}, -- Optional

          -- Autocompletion
          {'hrsh7th/nvim-cmp'},         -- Required
          {'hrsh7th/cmp-nvim-lsp'},     -- Required
          {'hrsh7th/cmp-buffer'},       -- Optional
          {'hrsh7th/cmp-path'},         -- Optional
          {'saadparwaiz1/cmp_luasnip'}, -- Optional
          {'hrsh7th/cmp-nvim-lua'},     -- Optional

          -- Snippets
          {'L3MON4D3/LuaSnip'},             -- Required
          {'rafamadriz/friendly-snippets'}, -- Optional
      }
  }
  use "akinsho/toggleterm.nvim"

  -- leap
  use {
    "ggandor/leap.nvim",
    config = function() require("leap").set_default_keymaps() end
  }
  -- Buffer lualine
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"

  -- indent-blankline
  use "lukas-reineke/indent-blankline.nvim"

  -- which-key
  use { "folke/which-key.nvim"}

  end)
