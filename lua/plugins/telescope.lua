return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
        require('telescope').setup {
            extensions = {
                fzf = {
                    fuzzy = true,                    -- false will only do exact matching
                    override_generic_sorter = true,  -- override the generic sorter
                    override_file_sorter = true,     -- override the file sorter
                    case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                                   -- the default case_mode is "smart_case"
                }
            }
        }
        pcall(require('telescope').load_extension, 'fzf')
        -- Keymaps
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = 'find [O]ld files' })
        vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
        vim.keymap.set('n', '<leader>/', function()
          -- You can pass additional configuration to telescope to change theme, layout, etc.
          builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
            winblend = 10,
            previewer = false,
          })
        end, { desc = '[/] Fuzzily search in current buffer' })
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'find [F]iles' })
        vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'find [K]eymaps' })
        vim.keymap.set('n', '<leader>ft', builtin.colorscheme, { desc = 'find [T]heme' })
        vim.keymap.set('n', '<leader>fg', builtin.registers, { desc = 'find Re[g]isters' })
        vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = 'find [W]ord' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'find [H]elp' })
        vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { desc = 'LSP find [r]eferences' })
        vim.keymap.set('n', '<leader>fi', builtin.lsp_implementations, { desc = 'LSP find [i]mplementation' })
        vim.keymap.set('n', '<leader>fd', builtin.lsp_definitions, { desc = 'LSP find [d]efinitions' })
        vim.keymap.set('n', '<leader>fe', builtin.diagnostics, { desc = 'LSP find [e]rror / diagnostics' })

    end
}
