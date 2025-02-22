local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
  debug = false,
  sources = {
    formatting.prettier.with {
      prefer_local = "node_modules/.bin"
    },
    formatting.rubocop,
    diagnostics.rubocop,
    formatting.stylua,
  },
}

local mason_null_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ok then
  return
end

mason_null_ls.setup({
    automatic_installation = false,
    automatic_setup = true,
})
