vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config.lazy")

vim.diagnostic.config({
  underline = false,
  severity_sort = true,
})
