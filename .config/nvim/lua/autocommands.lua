vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
    callback = function(event)
        ---@param keys string
        ---@param func function
        ---@param desc string
        local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        -- local buffer = event.buf
        -- local client = vim.lsp.get_client_by_id(event.data.client_id)
        -- Diagnostic keymaps
        map('<leader>cd', vim.diagnostic.open_float, 'Line Diagnostics')
        map('[d', function()
            vim.diagnostic.jump({ count = -1, float = true })
        end, 'Go to previous [D]iagnostic message')
        map(']d', function()
            vim.diagnostic.jump({ count = 1, float = true })
        end, 'Go to next [D]iagnostic message')
        -- map('<leader>e', vim.diagnostic.open_float, 'Show diagnostic [E]rror messages')
        -- map('<leader>q', vim.diagnostic.setloclist, 'Open diagnostic [Q]uickfix list')

        map("gD", vim.lsp.buf.declaration, "")
        map("gd", vim.lsp.buf.definition, "")
        map("K", vim.lsp.buf.hover, "")
        map("gi",  vim.lsp.buf.implementation, "")
        map("gr",  vim.lsp.buf.references, "")
        map("<leader>ca", vim.lsp.buf.code_action, "")
        map("<leader>df", function() vim.diagnostic.open_float({ border = 'rounded' }) end, "")
        map("<leader>dl",  vim.diagnostic.setloclist, "")
        map("<leader>fm",  vim.lsp.buf.format, "")
    end,
})
