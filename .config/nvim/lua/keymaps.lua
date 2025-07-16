local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "Y", '"+y', opts)

keymap("n", "<leader>h", ":nohl<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "Y", '"+y', opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)


-- Buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<leader>c", ":bp<BAR>bd#<cr>", opts)
keymap("n", "<leader>fp", ":CopyFilePath<cr>", opts)
keymap("n", "<leader>fp", ":CopyFilePath<cr>", opts)
keymap("n", "<leader>fj", ":PickContextFile<cr>", opts)

keymap("n", "<leader>bl", ":lua vim.o.background = 'light'<cr>", opts)
keymap("n", "<leader>bd", ":lua vim.o.background = 'dark'<cr>", opts)

keymap("n", "<C-N>", ":cnext<cr>", opts)
keymap("n", "<C-m>", ":cprev<cr>", opts)

-- OIL
keymap("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" }) -- open oil with dash (-)

vim.api.nvim_create_user_command('Search', ':Telescope live_grep search_dirs=<args>', { nargs=1, complete='file' })
vim.api.nvim_create_user_command('Find', ':Telescope find_files find_command=rg,--ignore,--hidden,--files,<args>', { nargs=1, complete='file' })

vim.keymap.set("n", "<S-T>", function()
  require("todo_float").open_todo()
end, { desc = "Open TODO float" })

vim.keymap.set("n", "<leader>z", function()
    require("zen-mode").toggle()
end, {})
