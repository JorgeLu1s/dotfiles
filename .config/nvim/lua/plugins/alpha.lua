return {
    "goolord/alpha-nvim",
    config = function ()
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = {
            [[                                                 ]],
            [[███    ██ ███████  ██████  ██    ██ ██ ███    ███]],
            [[████   ██ ██      ██    ██ ██    ██ ██ ████  ████]],
            [[██ ██  ██ █████   ██    ██ ██    ██ ██ ██ ████ ██]],
            [[██  ██ ██ ██      ██    ██  ██  ██  ██ ██  ██  ██]],
            [[██   ████ ███████  ██████    ████   ██ ██      ██]],
            [[                                                 ]],
        }
        dashboard.section.buttons.val = {
            dashboard.button("f", "󰈞  Find file", ":Telescope find_files <CR>"),
            dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("s", "  Modified files", ":Telescope git_status <CR>"),
            dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
            dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
            dashboard.button("t", "󰘎  Find text", ":Telescope live_grep <CR>"),
            dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
            dashboard.button("q", "󰈆  Quit Neovim", ":qa<CR>"),
        }

        dashboard.section.header.opts.hl = "Include"
        dashboard.section.buttons.opts.hl = "Keyword"
        dashboard.opts.opts.noautocmd = true

        require("alpha").setup(dashboard.opts)
    end
};
