return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        {
            "L3MON4D3/LuaSnip",
            tag = "v2.*",
            build = "make install_jsregexp"
        },
        "saadparwaiz1/cmp_luasnip",
    },
    config = function()
        local cmp = require('cmp')

        cmp.setup {
            mapping = {
                ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
                ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<c-y>"] = cmp.mapping(
                    cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Insert,
                        select = true,
                    },
                    { "i", "c" }
                ),
                ["<M-y>"] = cmp.mapping(
                    cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = false,
                    },
                    { "i", "c" }
                ),
            },

            -- Sources
            sources = {
                { name = 'buffer', keyword_length = 3 },
                { name = 'nvim_lsp'},
                { name = 'nvim_lua'},
                { name = 'path'},
                { name = 'luasnip'},
            },

            -- Snippets
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end
            },

            -- Menu formatting
            -- formatting = {
            --     format = lspkind.cmp_format {
            --         with_text = true,
            --         menu = {
            --             buffer = '[buf]',
            --             nvim_lsp = '[LSP]',
            --             nvim_lua = '[lua]',
            --             path = '[path]',
            --             luasnip = '[snip]',
            --         }
            --     }
            -- },

            -- Window style
            window = {
                completion = cmp.config.window.bordered()
            },

            experimental = {
                native_menu = false,
                ghost_text = true,
            }
        }
    end
}
