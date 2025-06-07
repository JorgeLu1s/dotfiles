return {
    { "mason-org/mason.nvim",
        cmd = "Mason",
        build = ":MasonUpdate",
        opts = {}
    },
    {
        "mason-org/mason-lspconfig.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {},
        dependencies = {
            'williamboman/mason.nvim',
            {
                "neovim/nvim-lspconfig",
                event = { "BufReadPre", "BufNewFile" },
            },
        },
    },
}
