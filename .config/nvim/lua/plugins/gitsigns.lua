local function gitsigns_remaps(bufnr)
    local gitsigns = require('gitsigns')
    local opts = { noremap = true, silent = true }
    opts.buffer = bufnr

    vim.keymap.set("n", "gj", gitsigns.next_hunk, opts)
    vim.keymap.set("n", "gk", gitsigns.prev_hunk, opts)
    vim.keymap.set("n", "<leader>gtb", gitsigns.toggle_current_line_blame, opts)
    vim.keymap.set("n", "<leader>gl", function() gitsigns.blame_line{full = true} end, opts)
    vim.keymap.set("n", "<leader>gb", gitsigns.blame_line, opts)
    vim.keymap.set("n", "gb", gitsigns.blame_line, opts)
    vim.keymap.set("n", "<leader>gd", gitsigns.preview_hunk_inline, opts)
    vim.keymap.set("n", "<leader>gp", gitsigns.preview_hunk, opts)

    vim.keymap.set("n", "<leader>grb", gitsigns.reset_buffer, opts)
    vim.keymap.set("n", "<leader>grh", gitsigns.reset_hunk, opts)
end

return {
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            on_attach = function(buffer)
                gitsigns_remaps(buffer)
            end,
            preview_config = {
                border = 'rounded',
            }
        }
    }
}
