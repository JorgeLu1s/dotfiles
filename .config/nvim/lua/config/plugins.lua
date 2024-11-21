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

-- Use a protected call so we don't error out on first use
-- local status_ok, lazy = pcall(require, "lazy")
-- if not status_ok then
--   return
-- end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- LSP
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig", -- enable LSP

    -- Add hooks to LSP to support Linter & Formatter
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
    },
    {
        "onsails/lspkind.nvim",
        event = { "VimEnter" },
    },
    {
        -- cmp plugins
        "hrsh7th/nvim-cmp", -- the completiton plugin
        dependencies = { "lspkind.nvim" },
        config = function()
            require("config.nvim-cmp")
        end,
    },
    { "hrsh7th/cmp-nvim-lsp", dependencies = { "nvim-cmp" } }, -- lsp completions
    { "hrsh7th/cmp-buffer", dependencies = { "nvim-cmp" } }, -- buffer completions
    { "hrsh7th/cmp-path", dependencies = { "nvim-cmp" } }, -- path completions
    { "hrsh7th/cmp-cmdline", dependencies = { "nvim-cmp" } }, -- cmdline completions
    { "L3MON4D3/LuaSnip", version = "v2.*", },

    -- Colorschemes
    -- "LunarVim/onedarker.nvim"
    -- "navarasu/onedark.nvim"
    -- use "hrsh7th/cmp-nvim-lua" -- lsp for lua completions
    "folke/tokyonight.nvim",
    -- "rose-pine/neovim"
    "EdenEast/nightfox.nvim",
    { "catppuccin/nvim", as = "catppuccin" },

    -- {
    --     "windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
    --     event = "InsertEnter",
    -- },

    "github/copilot.vim",

    -- "numToStr/Comment.nvim", -- comment code
    "nvim-lualine/lualine.nvim",

    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("config.telescope")
        end,
    },

    "christoomey/vim-tmux-navigator", -- Tmux Navigator
    "lewis6991/gitsigns.nvim", -- Git
    --"akinsho/bufferline.nvim",
    "b0o/SchemaStore.nvim", -- for jsonls
    "kyazdani42/nvim-web-devicons",
    "nvim-treesitter/nvim-treesitter-context",
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    },
    "goolord/alpha-nvim",
    -- "fgheng/winbar.nvim",

    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {},
        -- Optional dependencies
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
        -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    },
})
