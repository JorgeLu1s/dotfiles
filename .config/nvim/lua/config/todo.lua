local vim = vim

local function insert_below(new_line)
    local current_line = vim.fn.line(".")
    local current_indent = vim.fn.indent(current_line)

    for _ = 1, current_indent do
        new_line = " " .. new_line
    end

    vim.api.nvim_buf_set_lines(0, vim.fn.line("."), vim.fn.line("."), false, {new_line})
    vim.cmd "normal! j"
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("A", true, false, true), "n", true)
end

local function insert_above(new_line)
    local current_line = vim.fn.line(".")
    local current_indent = vim.fn.indent(current_line)

    for _ = 1, current_indent do
        new_line = " " .. new_line
    end

    if current_line > 1 then
        vim.api.nvim_buf_set_lines(0, current_line - 1, current_line - 1, false, {new_line})
        vim.cmd("normal! k")
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("A", true, false, true), "n", true)
    else
        vim.api.nvim_buf_set_lines(0, 0, 0, false, {new_line})
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("A", true, false, true), "n", true)
    end
end

function Toggle_item()
    local current_line = vim.fn.line(".")
    local line = vim.api.nvim_buf_get_lines(0, current_line - 1, current_line, false)[1]

    if string.find(line, "%[%]") then
        local new_line = line:gsub("%[%]", "[x]")
        vim.api.nvim_buf_set_lines(0, current_line - 1, current_line, false, {new_line})
        vim.api.nvim_buf_add_highlight(0, -1, "ItemCompleted", current_line - 1, 0, -1)
    elseif string.find(line, "%[x%]") then
        local new_line = line:gsub("%[x%]", "[]")
        vim.api.nvim_buf_set_lines(0, current_line - 1, current_line, false, {new_line})
    end
end

local function apply_item_completed_highlight()
    local pattern = "%[x%]"
    local buffer = vim.api.nvim_get_current_buf()
    local lines = vim.api.nvim_buf_get_lines(buffer, 0, -1, false)

    for i, line in ipairs(lines) do
        if string.find(line, pattern) then
            vim.api.nvim_buf_add_highlight(buffer, -1, 'ItemCompleted', i - 1, 0, -1)
        end
    end
end

function Insert_item_below()
    insert_below("- [] ")
end

function Insert_title_below()
    insert_below("## ")
end

function Insert_item_above()
    insert_above("- [] ")
end

function Insert_title_above()
    insert_above("## ")
end

local function setup(data)
    if string.find(data.filename, "%.todo%.md$") then
        local keymap = vim.api.nvim_buf_set_keymap
        local opts = { noremap = true, silent = true }
        local buf = tonumber(data.buf)

        keymap(buf, "n", "o", ":lua Insert_item_below()<CR>", opts)
        keymap(buf, "n", "O", ":lua Insert_item_above()<CR>", opts)
        keymap(buf, "n", ",", ":lua Toggle_item()<CR>", opts)
        keymap(buf, "n", "<Tab>", ">>", opts)
        keymap(buf, "n", "<S-Tab>", "<<", opts)
        keymap(buf, "n", "t", ":lua Insert_title_below()<CR>", opts)
        keymap(buf, "n", "T", ":lua Insert_title_above()<CR>", opts)
        -- keymap(buf, "i", "<Tab>", "<C-t>", opts)
        -- keymap(buf, "i", "<S-Tab>", "<C-d>", opts)

        apply_item_completed_highlight()
    end
end

vim.cmd("hi " .. "ItemCompleted" .. " guifg='Gray'")
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        local data = {
            buf = vim.fn.expand("<abuf>"),
            filename = vim.fn.expand("<afile>"),
        }
        vim.schedule(function()
            setup(data)
        end)
    end
})
