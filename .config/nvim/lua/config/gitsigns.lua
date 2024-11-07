local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
    return
end

local function gitsigns_remaps(bufnr)
    local opts = { noremap = true, silent = true }
    opts.buffer = bufnr

    vim.keymap.set("n", "gj", gitsigns.next_hunk, opts)
    vim.keymap.set("n", "gk", gitsigns.prev_hunk, opts)
    vim.keymap.set("n", "<leader>tb", gitsigns.toggle_current_line_blame, opts)
    vim.keymap.set("n", "<leader>gl", function() gitsigns.blame_line{full = true} end, opts)
    vim.keymap.set("n", "<leader>gb", gitsigns.blame_line, opts)
    vim.keymap.set("n", "gb", gitsigns.blame_line, opts)
    vim.keymap.set("n", "<leader>gd", gitsigns.diffthis, opts)

    vim.keymap.set("n", "<leader>rb", gitsigns.reset_buffer, opts)
    vim.keymap.set("n", "<leader>rh", gitsigns.reset_hunk, opts)

end

gitsigns.setup {
    signs = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
    },
    signs_staged = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
    },
    signs_staged_enable = true,
    signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
    numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = {
        interval = 1000,
        follow_files = true,
    },
    auto_attach = true,
    attach_to_untracked = false,
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
        use_focus = true,
    },
    current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000,
    preview_config = {
        -- Options passed to nvim_open_win
        border = "rounded",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
    },
    on_attach = gitsigns_remaps
}
