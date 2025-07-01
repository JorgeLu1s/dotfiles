return {
    "mfussenegger/nvim-lint",
    event = {
        "BufReadPre",
        "BufNewFile",
    },
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            javascript = { "eslint" },
            typescript = { "eslint" },
            javascriptreact = { "eslint" },
            typescriptreact = { "eslint" },
            svelte = { "eslint" },
            python = { "pylint" },
            ruby = { "rubocop" },
            eruby = { "rubocop" },
        }

        require("lint").linters.rubocop = {
            cmd = "bundle",
            stdin = true,
            args = {
                "exec", "rubocop",
                "--format", "json",
                "--force-exclusion",
                "--stdin", function()
                    return vim.api.nvim_buf_get_name(0)
                end,
            },
            stream = "stdout",
            ignore_exitcode = true,
            parser = require("lint.parser").from_errorformat([[%f:%l:%c: %t: %m]], {
                source = "rubocop",
                severity = {
                    E = vim.diagnostic.severity.ERROR,
                    W = vim.diagnostic.severity.WARN,
                },
            }),
        }
    end,
}
