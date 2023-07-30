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
            -- Set color theme
            vim.cmd[[colorscheme tokyonight-night]]

            -- Set floating window transparency
            -- ( doesn't seem to work )
            vim.g.tokyonight_dark_float = false
            vim.g.tokyonight_colors = { bg_float = "none", }
            vim.api.nvim_set_hl( 0, "TelescopeNormal", { bg = "none" } )

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
