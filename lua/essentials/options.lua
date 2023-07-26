local options = vim.opt
local global = vim.g
local windowOption = vim.wo

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
global.mapleader = " "
global.maplocalleader = " "

-- indentations
options.expandtab = true
options.tabstop = 4
options.shiftwidth = 4
options.shiftround = true
options.autoindent = true
options.smartindent = true

-- Make line numbers default
windowOption.number = true

-- Enable mouse mode
options.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
options.clipboard = 'unnamedplus'

-- Enable break indent
options.breakindent = true

-- Save undo history
options.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
options.ignorecase = true
options.smartcase = true

-- Keep signcolumn on by default
windowOption.signcolumn = 'yes'

-- Decrease update time
options.updatetime = 250
options.timeoutlen = 300

-- Set completeopt to have a better completion experience
options.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
options.termguicolors = true
