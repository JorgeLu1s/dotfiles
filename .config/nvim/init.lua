require "keymaps"
require "options"

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
}, {
    change_detection = {
        notify = false
    },
    rocks = {
        enabled = false,
    },
    performance = {
        rtp = {
            -- Stuff I don't use.
            disabled_plugins = {
                'gzip',
                'netrwPlugin',
                'rplugin',
                'tarPlugin',
                'tohtml',
                'tutor',
                'zipPlugin',
            },
        },
    },
})

require("autocommands")
require "diagnostics"

-- CUSTOM

require "colorscheme"
require "contextzip"
require "copy-file-path"
require "todo"
