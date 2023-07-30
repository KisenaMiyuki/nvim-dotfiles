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
            -- vim.cmd[[colorscheme tokyonight-night]]

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
    },
    {
        "rebelot/kanagawa.nvim",
        config = function ()
            -- Set color theme
            vim.cmd("colorscheme kanagawa")

            require('kanagawa').setup {
                overrides = function(colors)
                    local theme = colors.theme
                    return {
                            -- [[ Transparent Floating Window ]]
                        -- NormalFloat = { bg = "none" },
                        -- FloatBorder = { bg = "none" },
                        -- FloatTitle = { bg = "none" },
                        --
                        -- -- Save an hlgroup with dark background and dimmed foreground
                        -- -- so that you can use it where your still want darker windows.
                        -- -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
                        -- NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
                        --
                        -- -- Popular plugins that open floats will link to NormalFloat by default;
                        -- -- set their background accordingly if you wish to keep them dark and borderless
                        -- LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                        -- MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

                            -- [[ Borderless Telescope ]]
                        TelescopeTitle = { fg = theme.ui.special, bold = true },
                        TelescopePromptNormal = { bg = theme.ui.bg_p1 },
                        TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
                        TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
                        TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
                        TelescopePreviewNormal = { bg = theme.ui.bg_dim },
                        TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
                    }
                end
            }
        end
    }
}
