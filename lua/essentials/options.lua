local options = vim.opt
local global = vim.g
local windowOption = vim.wo

vim.keymap.set( '', '<space>', '<Nop>' )
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

-- Line wrap
options.wrap = false

-- Save undo history
options.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
options.ignorecase = true
options.smartcase = true

-- Keep signcolumn on by default
windowOption.signcolumn = 'yes'

-- Decrease update time
options.updatetime = 250
-- Time to wait for another key after leader key is pressed
options.timeoutlen = 500

-- Set completeopt to have a better completion experience
options.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
options.termguicolors = true

-- [[ Neovide ]]
if global.neovide then
    -- Cool cursor stuff
    global.neovide_cursor_animation_length = 0.05  -- Cursor animation duration
    global.neovide_cursor_vfx_mode = "railgun"  -- Cursor particle type
    global.neovide_cursor_vfx_opacity = 250.0  -- particle opacity
    global.neovide_cursor_vfx_particle_lifetime = 1.5  -- particle life time
    global.neovide_cursor_vfx_particle_density = 10.0  -- number of generated particles
    global.neovide_cursor_vfx_particle_speed = 9.0  -- speed of particle movement
            -- ** Only work for vfx = "railgun" **
            -- The higher the value, the less particles rotate in accordance to each other
            -- the lower, the more line-wise all particles become
    global.neovide_cursor_vfx_particle_phase = 1.5

    options.guifont = "CaskaydiaCove Nerd Font:h16"

    -- Blur for floating window
    global.neovide_floating_blur_amount_x = 2.0
    global.neovide_floating_blur_amount_y = 2.0

    -- Misc
    global.neovide_transparency = 0.95  -- Window transparency
    global.neovide_scroll_animation_length = 0.5  -- Scroll Animation Length
    global.neovide_hide_mouse_when_typing = true  -- Hide mouse when typing
    global.neovide_refresh_rate = 120  -- neovide fps
    global.neovide_refresh_rate_idle = 5  -- neovide fps when idle
    global.neovide_remember_window_size = true  -- Remember window size from previous session
end
