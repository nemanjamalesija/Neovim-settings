vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config.lazy")

-- Configure diagnostics to only show underlines
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
})

require("toggleterm").setup({})
-- vim.cmd.colorscheme("catppuccin")
