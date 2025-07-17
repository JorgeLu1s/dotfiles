return {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
        require("treesitter-context").setup({
            enable = true,
            max_lines = 3,        -- Max number of lines to show for context
            multiline_threshold = 1,
            trim_scope = 'outer', -- or 'inner'
            mode = 'cursor',      -- or 'topline'
            separator = "─",      -- you can add a line separator between context and code
            -- zindex = 20
        })
    end,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
}
