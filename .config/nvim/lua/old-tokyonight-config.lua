local function set_style(style)
  vim.g.tokyonight_style = style
  vim.cmd[[colorscheme tokyonight]]
  print("tokyonight style set to" .. style)
end

return {
  set_style = set_style
}
