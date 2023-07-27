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
            local on_attach = function(_, bufnr)
                -- Enable completion triggered by <c-x><c-o>
                -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
                vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

                local nmap = function(keys, func, desc)
                    if desc then
                        desc = 'LSP: ' .. desc
                    end

                    vim.keymap.set( 'n', keys, func, { --[[ noremap=true, silent=true, ]] buffer=bufnr, desc = desc })
                end
                nmap('K', vim.lsp.buf.hover, 'show hover info')
                nmap('gd', vim.lsp.buf.definition, 'goto [d]efinition')
                nmap('gi', vim.lsp.buf.implementation, 'goto [i]mplementation')
                nmap('gr', vim.lsp.buf.references, 'goto [r]eference')
                nmap('gD', vim.lsp.buf.declaration, 'goto [D]eclaration')
                nmap('<space>K', vim.lsp.buf.signature_help, 'show signature help')
                nmap('gt', vim.lsp.buf.type_definition, 'goto [t]ype definition')
                nmap('<F2>', vim.lsp.buf.rename, 'Rename symbol')
                nmap('<leader>rn', '<cmd>Lspsaga rename<CR>', '[R]e[n]ame symbol')
                nmap('<Leader>ca', vim.lsp.buf.code_action, '[C]ode [a]ction')
                nmap('<Leader>d', vim.lsp.buf.formatting, 'format [d]ocument')
                nmap('gda', vim.diagnostic.open_float, 'Show diagnostics')
                nmap('[d', vim.diagnostic.goto_prev, 'goto previous diagnostic')
                nmap(']d', vim.diagnostic.goto_next, 'goto next diagnostic')
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
                -- !!! This will overwrite the above setup content !!!
                -- So to get all the keybinds u need to call on_attach again
                ["lua_ls"] = function ()
                    require("lspconfig").lua_ls.setup {
                        on_attach = on_attach,
                        flags = { debounce_text_changes = 150  },
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
