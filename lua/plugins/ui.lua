return {
    {
        "akinsho/bufferline.nvim",
        version = "*",
        config = true,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
    	    require('indent_blankline').setup({
    		    show_first_indent_level = false
    	    })
    	end
    },
    {
        "lewis6991/gitsigns.nvim",
        config = true
    },
    {
        "goolord/alpha-nvim",
        config = function()
            require'alpha'.setup(require'alpha.themes.dashboard'.config)
        end
    },
    {
        "RRethy/vim-illuminate",
        config = function()
            require('illuminate').configure()
        end
    },
}
