local spaces = function()
    return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "echasnovski/mini.icons" },
    opts = {
        options = {
            icons_enabled = true,
            theme = "auto",
            -- theme = "tokyonight",
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = { "dashboard", "NvimTree", "Outline", "alpha" },
            always_divide_middle = true,
            refresh = {
                statusline = 100,
                tabline = 100,
                winbar = 100,
            },
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", "diff", "diagnostics" },
            lualine_c = { { "filename", path = 4 } },
            lualine_x = { spaces },
            lualine_y = { "filetype" },
            lualine_z = { "location" },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { "filename" },
            lualine_x = { "location" },
            lualine_y = {},
            lualine_z = {},
        },
        tabline = {},
        extensions = {},
    }
}
