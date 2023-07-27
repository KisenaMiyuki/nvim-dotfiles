return {
    {
        "williamboman/mason.nvim",
        opts = {
            PATH = 'prepend'
        }
    },
    {
        "folke/neodev.nvim",
    },
    {
        "williamboman/mason-lspconfig.nvim",
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- Mappings.
            -- local opts = { noremap=true, silent=true }

            -- Use an on_attach function to only map the following keys
            -- after the language server attaches to the current buffer
            local on_attach = function(client, bufnr)
                -- Enable completion triggered by <c-x><c-o>
                vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

                -- local bufopts = { noremap=true, silent=true, buffer=bufnr }
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'show hover info', noremap=true, silent=true, buffer=bufnr })
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'goto [d]efinition', noremap=true, silent=true, buffer=bufnr })
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = 'goto [i]mplementation', noremap=true, silent=true, buffer=bufnr })
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'goto [r]eference', noremap=true, silent=true, buffer=bufnr })
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'goto [D]eclaration', noremap=true, silent=true, buffer=bufnr })
                vim.keymap.set('n', '<space>K', vim.lsp.buf.signature_help, { desc = 'show signature help', noremap=true, silent=true, buffer=bufnr })
                vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { desc = 'goto [t]ype definition', noremap=true, silent=true, buffer=bufnr })
                vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, { desc = 'Rename symbol', noremap=true, silent=true, buffer=bufnr })
                vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, { desc = 'Rename symbol', noremap=true, silent=true, buffer=bufnr })
                vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, { desc = 'Code [a]ction', noremap=true, silent=true, buffer=bufnr })
                vim.keymap.set('n', '<Leader>mm', vim.lsp.buf.formatting, { desc = '[f]ormat document', noremap=true, silent=true, buffer=bufnr })
                vim.keymap.set('n', 'gda', vim.diagnostic.open_float, { desc = 'Show diagnostics', noremap=true, silent=true, buffer=bufnr })
                vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'goto previous diagnostic', noremap=true, silent=true, buffer=bufnr })
                vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'goto next diagnostic', noremap=true, silent=true, buffer=bufnr })
            end

            require('neodev').setup()
            -- this part is telling Neovim to use the lsp server
            --
            -- [[ The usual lspconfig way ]]
            -- local servers = { 'lua_ls', 'pyright', 'tsserver', 'jdtls', 'denols' }
            -- for _, lsp in pairs(servers) do
            --     require('lspconfig')[lsp].setup {
            --         on_attach = on_attach,
            --         flags = { debounce_text_changes = 150, }
            --     }
            -- end
            --
            -- [[ the mason-lspconfig automatic way ]]
            require("mason-lspconfig").setup_handlers {
                -- The first entry (without a key) will be the default handler
                -- and will be called for each installed server that doesn't have
                -- a dedicated handler.
                function (server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        on_attach = on_attach,
                        flags = { debounce_text_changes = 150  }
                    }
                end,
                -- Next, you can provide a dedicated handler for specific servers.
                --
                ["lua_ls"] = function ()
                    require("lspconfig").lua_ls.setup {
                        settings = {
                            Lua = {
                                workspace = { checkThirdParty = false },
                                telemetry = { enable = false }
                            }
                        }
                    }
                end
            }

            -- this is for diagnositcs signs on the line number column
            -- use this to beautify the plain E W signs to more fun ones
            -- !important nerdfonts needs to be setup for this to work in your terminal
            local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl= hl, numhl = hl })
            end
        end
    },
    {
        -- Lsp loading info
        "j-hui/fidget.nvim",
        tag = "legacy",
        event = "LspAttach",
        opts = {
            -- options
        }
    },
    {
        -- Lsp UI rice
        'nvimdev/lspsaga.nvim',
        config = function()
            require('lspsaga').setup({})
        end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter', -- optional
            'nvim-tree/nvim-web-devicons'     -- optional
        }
    },
}
