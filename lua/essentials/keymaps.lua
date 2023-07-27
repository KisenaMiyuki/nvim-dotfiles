local keymap = vim.keymap

-- Make <Space> don't do anything in Normal & Visual mode
keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

keymap.set("n", "<Tab>", "<cmd>bNext<CR>", { desc = 'Next Buffer' })
keymap.set("n", "<Leader>x", ":bd<CR>", { desc = 'Close buffer' })

keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

-- Escape to remove search highlight in Normal mode
keymap.set( 'n' , '<Esc>', '<cmd>noh<CR>')

-- ii to jump out of Insert mode
keymap.set( { 'i', 'v' }, 'ii', '<Esc>', { desc = 'Exit to Normal mode' })

-- Window navigation
keymap.set( 'n', '<C-h>', '<C-w>h', { desc = 'Go to left window' } )
keymap.set( 'n', '<C-l>', '<C-w>l', { desc = 'Go to right window' } )
keymap.set( 'n', '<C-j>', '<C-w>j', { desc = 'Go to below window' } )
keymap.set( 'n', '<C-k>', '<C-w>k', { desc = 'Go to up window' } )
-- Window resize
keymap.set( 'n', '<C-Up>', '<C-w>+', { desc = 'Resize window ↑' } )
keymap.set( 'n', '<C-Down>', '<C-w>-', { desc = 'Resize window ↓' } )
keymap.set( 'n', '<C-Left>', '<C-w>>', { desc = 'Resize window ←' } )
keymap.set( 'n', '<C-Right>', '<C-w><', { desc = 'Resize window →' } )
-- Other window action
keymap.set( 'n', '<leader>wd', '<C-w>q', { desc = 'window delete' } )
keymap.set( 'n', '<leader>ws', '<C-w>s', { desc = 'horizontal split' } )
keymap.set( 'n', '<leader>wv', '<C-w>v', { desc = 'vertical split' } )
