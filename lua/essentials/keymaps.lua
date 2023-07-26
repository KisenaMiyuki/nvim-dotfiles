local keymap = vim.keymap

keymap.set("n", "<Tab>", "<cmd>bNext<CR>")
keymap.set("n", "<Leader>x", "<cmd>bd<CR>")

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Make <Space> don't do anything in Normal & Visual mode
keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Escape to remove search highlight in Normal mode
keymap.set( 'n' , '<Esc>', '<cmd>noh<CR>')

-- jk to jump out of Insert mode
keymap.set( 'i', 'jk', '<Esc>' )