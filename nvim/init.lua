-- Disable default file explorer
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config.lazy")

-- Configure diagnostics to only show underlines
vim.diagnostic.config({
  underline = false,
  severity_sort = true,
})

-- Underline colors
-- vim.cmd([[
-- hi DiagnosticUnderlineError guisp='#ff6188' gui=undercurl
-- hi DiagnosticUnderlineWarn guisp='#fd9621' gui=undercurl
-- set termguicolors
-- ]])
--
