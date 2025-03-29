
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config.lazy")

vim.diagnostic.config({
  underline = false,
  severity_sort = true,
})

-- Cursor highlight colors
vim.cmd("highlight Cursor guibg=#dcd5ac")
vim.cmd("highlight CursorInsert guibg=#e98a00 gui=bold")
vim.cmd("highlight CursorReplace guibg=#dcd5ac")
vim.cmd("highlight CursorVisual guibg=#dcd5ac")

-- Cursor appearance and blinking settings
vim.opt.guicursor = {
  "n-v-c:block-Cursor", -- Normal, Visual, Command-line mode: block cursor
  "i-ci-ve:ver25-CursorInsert", -- Insert mode: vertical bar (25% width)
  "r-cr:hor20-CursorReplace", -- Replace mode: horizontal bar (20% height)
  "o:hor50-Cursor", -- Operator-pending mode: horizontal bar (50% height)
  "a:blinkwait700-blinkoff400-blinkon250", -- Blink settings for all modes
  "sm:block-blinkwait175-blinkoff150-blinkon175", -- Showmatch with different blink settings
}

vim.opt.number = true
