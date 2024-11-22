local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

-- local hide_in_width = function()
--     return vim.fn.winwidth(0) > 80
-- end

local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    sections = { "error", "warn", "info", "hint" },
    symbols = { error = " ", warn = " ", info= " ", hint = " " },
    colored = true,
    update_in_insert = false,
    always_visible = false,
}

-- local diff = {
--     "diff",
--     colored = true,
--     symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
--     cond = hide_in_width
-- }

local branch = {
    "branch",
    icons_enabled = true,
    icon = "",
}

local spaces = function()
    return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

local custom_fname = require('lualine.components.filename'):extend()
local highlight = require 'lualine.highlight'

function custom_fname:init(options)
    custom_fname.super.init(self, options)
    self.status_highlights = {
        saved = highlight.create_component_highlight_group(
            { gui = "" }, 'filename_status_saved', self.options),
        modified = highlight.create_component_highlight_group(
            { gui = "bold" }, 'filename_status_modified', self.options),
    }
end

function custom_fname:update_status()
    local data = custom_fname.super.update_status(self)
    local highlight_group = vim.bo.modified and self.status_highlights.modified or self.status_highlights.saved
    return highlight.component_format_highlight(highlight_group) .. data
end

lualine.setup({
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
        lualine_b = { branch, "diff", diagnostics },
        lualine_c = { { custom_fname, path = 1 } },
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
    -- winbar = {
    --     lualine_a = {},
    --     lualine_b = {},
    --     lualine_c = {'buffers'},
    --     lualine_x = {},
    --     lualine_y = {},
    --     lualine_z = {}
    -- },
    tabline = {},
    extensions = {},
})
