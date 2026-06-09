return {
    {
        "EdenEast/nightfox.nvim",
        config = function()
            require("nightfox").setup({
                palettes = {
                    nordfox = {
                        bg0 = "#2E3440",
                        bg1 = "#232831",
                        sel0 = "#3B4252",
                        bg3 = "#2E3440",
                    },
                },
                groups = {
                    all = {
                        NormalFloat = { bg = "none" },
                        Pmenu = { bg = "none" },
                        -- PmenuSel = { bg = "#3B4252" }
                    }
                },
            })
        end,
    },
    {
        "thesimonho/kanagawa-paper.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            auto_plugins = false,
            all_plugins = false,
            plugins = {
                -- telescope = false,
                -- nvim_treesitter_context = true
            },
            overrides = function(colors)
                return {
                    TreesitterContext = { bg = "none", link = "Normal" },
                    TreesitterContextBottom = { bg = "none" },
                    TreesitterContextSeparator = { bg = "none", link = "NonText" },
                    -- TreesitterContextLineNumber = {  bg = "none" },
                }
            end
        },
    },
    {
        "baliestri/aura-theme",
        lazy = false,
        priority = 1000,
        config = function(plugin)
            vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
            -- vim.cmd([[colorscheme aura-dark]])
        end
    },
    {
        dir = "~/code/personal/nvim/vs-26.nvim", -- local path
        lazy = false,
        priority = 1000,
    }
}
