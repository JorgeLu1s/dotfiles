local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

configs.setup {
    ensure_installed = "all", -- can be "maintained" or a list of languages
    sync_install = false,
    ignore_install = {}, -- List of parsers to ignore installing
    autopairs = {
        enable = true,
    },
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "" }, -- list of language that will be disabled
        additional_vim_regex_highlighting = true,
    },
    indent = { enable = true, disable = { "yaml" } }
}

local comment_status_ok, comment_string = pcall(require, "ts_context_commentstring")
if not comment_status_ok then
    return
end

comment_string.setup {
    enable_autocmd = false,
}
