local keymap = vim.keymap

-- Make <Space> don't do anything in Normal & Visual mode
keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

keymap.set("n", "<Tab>", "<cmd>bNext<CR>")
keymap.set("n", "<Leader>x", ":bd<CR>", { desc = 'Close buffer' })

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Escape to remove search highlight in Normal mode
keymap.set( 'n' , '<Esc>', '<cmd>noh<CR>')

-- ii to jump out of Insert mode
keymap.set( { 'i', 'v' }, 'ii', '<Esc>' )

-- Window navigation
keymap.set( 'n', '<C-h>', '<C-w>h' )
keymap.set( 'n', '<C-l>', '<C-w>l' )
keymap.set( 'n', '<C-j>', '<C-w>j' )
keymap.set( 'n', '<C-k>', '<C-w>k' )
-- Window resize
keymap.set( 'n', '<C-Up>', '<C-w>+' )
keymap.set( 'n', '<C-Down>', '<C-w>-' )
keymap.set( 'n', '<C-Left>', '<C-w>>' )
keymap.set( 'n', '<C-Right>', '<C-w><' )
-- Other window action
-- keymap.set( 'n', '<Leader>wd', '<C-w>q', { desc = 'window delete' } )
-- keymap.set( 'n', '<Leader>ws', '<C-w>s', { desc = 'horizontal split' } )
-- keymap.set( 'n', '<Leader>wv', '<C-w>v', { desc = 'vertical split' } )
