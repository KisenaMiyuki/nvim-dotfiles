local keymap = vim.keymap

-- Make <Space> don't do anything in Normal & Visual mode
keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

keymap.set("n", "<Tab>", "<cmd>bNext<CR>")
keymap.set("n", "<Leader>x", "<cmd>bd<CR>", { desc = 'Close buffer' })

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Escape to remove search highlight in Normal mode
keymap.set( 'n' , '<Esc>', '<cmd>noh<CR>')

-- ii to jump out of Insert mode
keymap.set( { 'i', 'v' }, 'ii', '<Esc>' )
