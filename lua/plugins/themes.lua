return {
    {
    	"folke/tokyonight.nvim",
    	lazy = false,
    	priority = 1000,
    	dependencies = {
    		-- lualine & dependencies
    		"nvim-lualine/lualine.nvim",
    		"nvim-tree/nvim-web-devicons",
    		-- barbecue & denpendencies
    		"utilyre/barbecue.nvim",
    		"SmiteshP/nvim-navic",
    	},
    	config = function()
    		-- enable tokyonight theme on load
            vim.cmd[[colorscheme tokyonight-night]]
            -- set lualine theme to tokyonight
            require('lualine').setup({
            	options = {
            		theme = "tokyonight"
            	}
            })
            -- set barbeque theme to tokyonight
            require('barbecue').setup({
            	theme = "tokyonight"
            })
    	end
	}
}