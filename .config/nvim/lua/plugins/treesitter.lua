return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    opts = {
        indent = { enable = true }
    }
}
