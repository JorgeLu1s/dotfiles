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
        map('<leader>cd', function ()
            vim.diagnostic.open_float({
                max_width = math.floor(vim.o.columns * 0.4),
                max_height = math.floor(vim.o.lines * 0.5)
            })
        end, 'Line Diagnostics')
        map('[d', function()
            vim.diagnostic.jump({ count = -1, float = true })
        end, 'Go to previous [D]iagnostic message')
        map(']d', function()
            vim.diagnostic.jump({ count = 1, float = true })
        end, 'Go to next [D]iagnostic message')
        -- map('<leader>e', vim.diagnostic.open_float, 'Show diagnostic [E]rror messages')
        -- map('<leader>q', vim.diagnostic.setloclist, 'Open diagnostic [Q]uickfix list')

        map("K", function ()
           vim.lsp.buf.hover({
               max_width = math.floor(vim.o.columns * 0.7),
               max_height = math.floor(vim.o.lines * 0.7),
               border = "rounded"
           })
        end, "")
        map("gD", vim.lsp.buf.declaration, "")
        map("gd", vim.lsp.buf.definition, "")
        map("gi",  vim.lsp.buf.implementation, "")
        map("gr",  vim.lsp.buf.references, "")
        map("<leader>ca", vim.lsp.buf.code_action, "")
        map("<leader>df", function() vim.diagnostic.open_float({ border = 'rounded' }) end, "")
        map("<leader>dl",  vim.diagnostic.setloclist, "")
        map("<leader>fm",  vim.lsp.buf.format, "")
    end,
})
