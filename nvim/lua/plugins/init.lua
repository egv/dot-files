return {  
  { "folke/lazy.nvim", version = "*" },
  "nvim-lua/plenary.nvim",
  {
	  'nvim-telescope/telescope.nvim', version = '0.1.8',
	  dependencies = { {'nvim-lua/plenary.nvim'} } 
  },
  { "catppuccin/nvim", name = "catppuccin" },
  {'nvim-treesitter/nvim-treesitter', build =  ':TSUpdate'},
  'theprimeagen/harpoon',
}

