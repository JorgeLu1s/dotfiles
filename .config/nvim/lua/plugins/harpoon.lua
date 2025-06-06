return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function()
        require("telescope").load_extension('harpoon')
        local harpoon = require('harpoon')
        -- harpoon:setup({})

        vim.keymap.set("n", "<leader>m", function() harpoon:list():add() end)
        vim.keymap.set("n", "<leader>l", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        vim.keymap.set("n", "<leader>q", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<leader>w", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<leader>e", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<leader>r", function() harpoon:list():select(4) end)
        vim.keymap.set("n", "<leader>t", function() harpoon:list():select(5) end)
    end
}
