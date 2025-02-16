return require('packer').startup(function(use)

    use 'wbthomason/packer.nvim'

    use { "catppuccin/nvim", as = "catppuccin" }

    use {
	'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use "nvim-lua/plenary.nvim"

    use {
	'nvim-telescope/telescope.nvim', tag = '0.1.8',
	requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	requires = { {"nvim-lua/plenary.nvim"} }
    }

    use {
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
    }

    use {
	'hrsh7th/nvim-cmp',         
	'hrsh7th/cmp-nvim-lsp',    
	'hrsh7th/cmp-buffer',     
	'hrsh7th/cmp-path',      
	'hrsh7th/cmp-cmdline',  
	'L3MON4D3/LuaSnip',    
    }
end)
