local M = {}

local uv = vim.loop

local function get_todo_filename()
  local cwd = vim.fn.getcwd()
  local name = vim.fn.fnamemodify(cwd, ":t") -- get the leaf directory name
  local todos_dir = vim.fn.expand("~/code/todos")
  vim.fn.mkdir(todos_dir, "p") -- ensure it exists
  return todos_dir .. "/" .. name .. ".todo.md"
end

local function open_float_buffer(filepath)
  local buf = vim.fn.bufadd(filepath)
  vim.fn.bufload(buf)

  local width = math.floor(vim.o.columns * 0.5)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
    title = "Todo",
  })

  vim.bo[buf].buftype = ""
  vim.bo[buf].filetype = "markdown"
  vim.bo[buf].modifiable = true
  vim.bo[buf].bufhidden = "wipe"

  -- Map 'q' in normal mode to close the floating window
  vim.keymap.set("n", "q", function()
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
  end, { buffer = buf, nowait = true, silent = true })
end

function M.open_todo()
  local filepath = get_todo_filename()
  open_float_buffer(filepath)
end

function M.setup()
  vim.api.nvim_create_user_command("TodoFloat", M.open_todo, {})
end

return M
