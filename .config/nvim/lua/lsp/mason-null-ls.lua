local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
    debug = false,
    sources = {
        -- Prettier for JS/TS
        formatting.prettier.with {
            prefer_local = "node_modules/.bin"
        },

        -- Stylua for Lua
        formatting.stylua,

        -- RuboCop formatting via bundle exec
        formatting.rubocop.with({
            command = "bundle",
            args = {
                "exec", "rubocop",
                "--auto-correct",
                "--stdin", "$FILENAME",
                "-f", "quiet",
                "--stderr"
            },
        }),

        -- RuboCop diagnostics via bundle exec
        diagnostics.rubocop.with({
            command = "bundle",
            args = {
                "exec", "rubocop",
                "--format", "json",
                "--force-exclusion",
                "--stdin", "$FILENAME"
            },
        }),
    },
}

-- mason-null-ls setup
local mason_null_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ok then
    return
end

mason_null_ls.setup({
    automatic_installation = {
        exclude = {},
    },
    -- automatic_setup = true,
})

