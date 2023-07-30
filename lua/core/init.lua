local opt = vim.opt
local g = vim.g
local config = require("core.utils").load_config()

-------------------------------------- globals -----------------------------------------
g.nvchad_theme = config.ui.theme
g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
g.toggle_theme_icon = "   "
g.transparency = config.ui.transparency

-------------------------------------- options ------------------------------------------
opt.laststatus = 3 -- global statusline
opt.showmode = false

opt.clipboard = "unnamedplus"
opt.cursorline = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.ruler = false

-- disable nvim intro
opt.shortmess:append "sI"

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

g.mapleader = " "

-- disable some default providers
for _, provider in ipairs { "node", "perl", "python3", "ruby" } do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- add binaries installed by mason.nvim to path
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.fn.stdpath "data" .. "/mason/bin" .. (is_windows and ";" or ":") .. vim.env.PATH

-------------------------------------- autocmds ------------------------------------------
local autocmd = vim.api.nvim_create_autocmd

-- dont list quickfix buffers
autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
  end,
})

-- reload some chadrc options on-save
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = vim.tbl_map(
    vim.fs.normalize,
    vim.fn.glob(vim.loop.fs_realpath(vim.fn.stdpath "config" .. "/lua/custom/**/*.lua"), true, true, true)
  ),
  group = vim.api.nvim_create_augroup("ReloadNvChad", {}),

  callback = function(opts)
    local fp = vim.fn.fnamemodify(vim.fs.normalize(vim.api.nvim_buf_get_name(opts.buf)), ":r") --[[@as string]]
    local app_name = vim.env.NVIM_APPNAME and vim.env.NVIM_APPNAME or "nvim"
    local module = string.gsub(fp, "^.*/" .. app_name .. "/lua/", ""):gsub("/", ".")

    require("plenary.reload").reload_module "base46"
    require("plenary.reload").reload_module(module)
    require("plenary.reload").reload_module "custom.chadrc"

    config = require("core.utils").load_config()

    vim.g.nvchad_theme = config.ui.theme
    vim.g.transparency = config.ui.transparency

    -- statusline
    require("plenary.reload").reload_module("nvchad_ui.statusline." .. config.ui.statusline.theme)
    vim.opt.statusline = "%!v:lua.require('nvchad_ui.statusline." .. config.ui.statusline.theme .. "').run()"

    require("base46").load_all_highlights()
    -- vim.cmd("redraw!")
  end,
})

-------------------------------------- commands ------------------------------------------
local new_cmd = vim.api.nvim_create_user_command

new_cmd("NvChadUpdate", function()
  require "nvchad.update"()
end, {})


-- [[ Neovide ]]
if g.neovide then
  -- Cool cursor stuff
  g.neovide_cursor_animation_length = 0.05  -- Cursor animation duration
  g.neovide_cursor_vfx_mode = "railgun"  -- Cursor particle type
  g.neovide_cursor_vfx_opacity = 200.0  -- particle opacity
  g.neovide_cursor_vfx_particle_lifetime = 1.5  -- particle life time
  g.neovide_cursor_vfx_particle_density = 12.0  -- number of generated particles
  g.neovide_cursor_vfx_particle_speed = 9.0  -- speed of particle movement
      -- ** Only work for vfx = "railgun" **
      -- The higher the value, the less particles rotate in accordance to each other
      -- the lower, the more line-wise all particles become
  g.neovide_cursor_vfx_particle_phase = 2

  opt.guifont = "CaskaydiaCove Nerd Font:h14"

  -- Blur for floating window
  g.neovide_window_floating_opacity = 0
  g.neovide_window_floating_blur = 2.0
  g.neovide_floating_blur_amount_x = 2.0
  g.neovide_floating_blur_amount_y = 2.0

  -- Misc
  g.neovide_transparency = 0.9  -- Window transparency
  g.neovide_scroll_animation_length = 0.5  -- Scroll Animation Length
  g.neovide_hide_mouse_when_typing = true  -- Hide mouse when typing
  g.neovide_refresh_rate = 120  -- neovide fps
  g.neovide_refresh_rate_idle = 5  -- neovide fps when idle
  g.neovide_remember_window_size = true  -- Remember window size from previous session
end
