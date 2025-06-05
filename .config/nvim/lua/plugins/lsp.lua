return {
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            { 
                "neovim/nvim-lspconfig",
                config = function()
                    -- Set float borders BEFORE any LSP servers start
                    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
                        vim.lsp.handlers.hover,
                        { border = "rounded" }
                    )

                    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
                        vim.lsp.handlers.signature_help,
                        { border = "rounded" }
                    )

                    -- now start servers
                    -- require("lspconfig").lua_ls.setup({})
                    -- require("lspconfig").tsserver.setup({})
                    -- etc.
                end,
            },
        },
    },
}
