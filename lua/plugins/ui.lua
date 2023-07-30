return {
    {
        "akinsho/bufferline.nvim",
        version = "*",
        config = true,
    },
    {
        'huy-hng/anyline.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        config = true,
        event = 'VeryLazy',
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
