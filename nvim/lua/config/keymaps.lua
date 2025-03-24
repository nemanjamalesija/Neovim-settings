-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- -- Add this to ~/.config/nvim/lua/config/keymaps.lua (if using LazyVim)
-- or add to your init.lua if you have a different setup
vim.keymap.set("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
vim.keymap.set("n", "<leader>F", "<cmd>Telescope live_grep<cr>", { desc = "Live grep (find text)" })

-- File explorer
vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeFindFileToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>O", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })

-- Toggle terminal
vim.api.nvim_set_keymap("n", "<leader>`", ":ToggleTerm<CR>", { noremap = true, silent = true })

-- Navigate to buffer on the left/right (previous/next buffer)
vim.api.nvim_set_keymap("n", "<Leader>wh", ":bprevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>wl", ":bnext<CR>", { noremap = true, silent = true })

-- Remap vim-move keys with Alt (A) to move lines up and down
vim.api.nvim_set_keymap("n", "<A-k>", "<Plug>MoveLineUp", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-j>", "<Plug>MoveLineDown", { noremap = true, silent = true })
