return {
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },
    {
        -- [[ Return to last cursor position when reopen file ]]
        "ethanholz/nvim-lastplace",
        config = true
    },
    {
        -- [[ flash: navigation ]]
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {
            label = {
                -- Enable this to use rainbow colors to highlight labels
                -- Can be useful for visualizing Treesitter ranges.
                rainbow = { enabled = true, shade = 5 }
            }
        },
        -- stylua: ignore
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
    },
    {
        -- [[ nvim-tree ]]
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { desc = 'toggle tree' }),
            view = { width = 25 },
            filters = { dotfiles = true },
            on_attach = function (bufnr)
                local api = require "nvim-tree.api"

                local function opts(desc)
                    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                end

                -- default mappings
                api.config.mappings.default_on_attach(bufnr)

                -- custom mappings
                vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
                vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
            end
        }
    },
    {
        -- [[ which-key ]]
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
    {
        "numToStr/Comment.nvim",
        config = true
    }
}
