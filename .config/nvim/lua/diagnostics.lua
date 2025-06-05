vim.diagnostic.config({
  virtual_text = false,   -- or true, if you want inline diagnostics
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded", -- <- this ensures jump float uses border
    source = "always",  -- optional, show diagnostic source
    header = "",        -- optional
    prefix = "",        -- optional
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN]  = "",
      [vim.diagnostic.severity.HINT]  = "",
      [vim.diagnostic.severity.INFO]  = "",
    },
  },
})
