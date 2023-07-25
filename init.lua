--==================== lazy.nvim ====================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- Clone lazy.nvim if not already
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none", -- prevent the cloning of large binary files
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
-- add the lazypath directory to the list of directories that Neovim will search for plugins
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", opts) -- spin up lazy.nvim