vim.api.nvim_set_hl(0, "WinBarModified", { fg = "#ff4d4d", bold = true })  -- Red bold text for modified files
vim.api.nvim_set_hl(0, "WinBarDefault", { fg = "#ffffff" })               -- Default white text

function Custom_winbar()
    local exclude_filetypes = { "dashboard", "alpha", "NvimTree", "help" }

    -- Exclude certain filetypes
    if vim.tbl_contains(exclude_filetypes, vim.bo.filetype) then
        return ""
    end

    -- Check if the buffer is modified
    local is_modified = vim.bo.modified
    local filename = vim.fn.expand("%:t") -- Get the filename

    if is_modified then
        return string.format(" %%#WinBarModified#%s %%m", filename)  -- Apply 'WinBarModified' highlight
    else
        return string.format(" %%#WinBarDefault#%s", filename)  -- Apply 'WinBarDefault' highlight
    end
end

-- Apply the custom winbar globally
vim.o.winbar = "%{%v:lua.Custom_winbar()%}"
