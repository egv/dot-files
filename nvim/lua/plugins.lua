-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use "nvim-lua/plenary.nvim"
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  requires = { {'nvim-lua/plenary.nvim'} } 
  }
  use { "catppuccin/nvim", as = "catppuccin" }
  use ('nvim-treesitter/nvim-treesitter', {run =  ':TSUpdate'})
  use ('theprimeagen/harpoon')
  use ('mbbill/undotree') 
  use ('tpope/vim-fugitive') 
  use ('preservim/nerdtree')
  use {
    "coder/claudecode.nvim",
    requires = {
      "folke/snacks.nvim", -- Optional dependency
    },
    config = function()
      require("claudecode").setup({
        -- Optional configuration
      })
    end
  }
end)

