vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config.lazy")

vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#5b595c" })

-- Configure diagnostics to only show underlines
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
})

require("toggleterm").setup({})
-- vim.cmd.colorscheme("catppuccin")
