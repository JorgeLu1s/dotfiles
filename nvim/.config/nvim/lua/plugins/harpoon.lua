return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("harpoon").setup({
            menu = {
                border = "rounded",
            }
        })
    end,
    keys = function()
        local keys = {
            {
                "<leader>m",
                function()
                    require("harpoon"):list():add()
                end,
                desc = "Harpoon File",
            },
            {
                "<leader>fl",
                function()
                    local harpoon = require("harpoon")
                    harpoon.ui:toggle_quick_menu(harpoon:list())
                end,
                desc = "Harpoon Quick Menu",
            },
        }

        local menu_keys = {"s", "d", "w", "e", "k", "l", "i", "o"}
        for i = 1, 8 do
            table.insert(keys, {
                "<leader>" .. menu_keys[i],
                function()
                    require("harpoon"):list():select(i)
                end,
                desc = "Harpoon to File " .. i,
            })
        end
        return keys
    end,
}
