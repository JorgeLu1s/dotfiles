-- require "alpha"
-- require "colorscheme"
-- require "gitsigns"
-- require "harpoon"
-- require "impatient"
-- require "lazy"
-- require "lsp.init"
-- require "lualine"
-- require "nvim-treesitter-context"
-- require "oil"
-- require "plugins"
-- require "treesitter"
require "contextzip"
require "copy-file-path"
require "keymaps"
require "options"
require "todo"

local fn = vim.fn

-- Automatically install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    import = "plugins"
})

require("autocommands")
