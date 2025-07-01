-- Inside your lsp config/init.lua or plugin spec file
local lspconfig = require("lspconfig")

lspconfig.tailwindcss.setup({
    filetypes = {
        "html",
        "css",
        "javascript",
        "typescript",
        "vue",
        "svelte",
        "php",
        "eruby",
    },
    -- Optional: root_dir override if needed
    root_dir = lspconfig.util.root_pattern("tailwind.config.js", "tailwind.config.ts", "postcss.config.js", "package.json", ".git"),
})

lspconfig.emmet_ls.setup({
    -- on_attach = on_attach,
    filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
    init_options = {
      html = {
        options = {
          -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
          ["bem.enabled"] = true,
        },
      },
    }
})
