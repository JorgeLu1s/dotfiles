vim.lsp.config("tailwindcss", {
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
    root_markers = { "tailwind.config.js", "tailwind.config.ts", "postcss.config.js", "package.json", ".git" },
})

vim.lsp.config("emmet_language_server", {
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

vim.lsp.enable("tailwindcss")
vim.lsp.enable("emmet_language_server")

