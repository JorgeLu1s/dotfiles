return {
    "folke/tokyonight.nvim",
    { 
        "EdenEast/nightfox.nvim", init = function()
            vim.cmd("colorscheme nordfox")
        end
    },
    { "catppuccin/nvim", as = "catppuccin" },
}
