return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    branch = 'main',
    lazy = false,
    build = ":TSUpdate",
    opts = {
        indent = { enable = true }
    }
}
