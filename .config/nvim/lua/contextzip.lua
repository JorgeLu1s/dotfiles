-- Function to append current file to contextzip.md
local function pick_file()
    local current_file = vim.fn.expand('%')
    local dest_file = vim.fn.expand('~/code/context-repo/contextzip.md')

    -- Check if current file exists and is not empty
    if current_file == '' then
        vim.notify('No file is currently open', vim.log.levels.WARN)
        return
    end

    -- Get the filename without path
    local filename = vim.fn.fnamemodify(current_file, ':t')

    -- Read current file content
    local lines = vim.fn.readfile(current_file)

    -- Create the content to append
    local content_to_append = {}

    -- Check if destination file exists to determine if we need "==== new context"
    local dest_exists = vim.fn.filereadable(dest_file) == 1
    local dest_content = {}
    if dest_exists then
        dest_content = vim.fn.readfile(dest_file)
    end

    -- If file doesn't exist or is empty, add the context header
    if not dest_exists or #dest_content == 0 then
        table.insert(content_to_append, '==== new context')
        table.insert(content_to_append, '')
    end

    -- Add file header
    table.insert(content_to_append, '== FILE: ' .. filename .. ' ==')
    table.insert(content_to_append, '```')

    -- Add file content
    for _, line in ipairs(lines) do
        table.insert(content_to_append, line)
    end

    table.insert(content_to_append, '```')

    -- Add file footer
    table.insert(content_to_append, '== END OF FILE ==')
    table.insert(content_to_append, '')

    -- Append to destination file
    local file = io.open(vim.fn.expand(dest_file), 'a')
    if file then
        for _, line in ipairs(content_to_append) do
            file:write(line .. '\n')
        end
        file:close()
        vim.notify('File "' .. filename .. '" added to contextzip.md', vim.log.levels.INFO)
    else
        vim.notify('Error: Could not open ' .. dest_file, vim.log.levels.ERROR)
    end
end

-- Create the PickFile command
vim.api.nvim_create_user_command('PickContextFile', pick_file, {
  desc = 'Add current file to ~/code/contextzip.md'
})
