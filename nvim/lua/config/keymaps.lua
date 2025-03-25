-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- -- Add this to ~/.config/nvim/lua/config/keymaps.lua (if using LazyVim)
-- or add to your init.lua if you have a different setup
--
-- File explorer
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFindFileToggle<cr>", { desc = "Toggle NvimTree (reveal file)" })
vim.keymap.set("n", "<leader>O", "<cmd>NvimTreeFindFile<cr>", { desc = "Reveal current file in NvimTree" })

-- Terminal
vim.api.nvim_set_keymap("n", "<leader>`", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<leader>`", [[<C-\><C-n><cmd>ToggleTerm<CR>]], { noremap = true, silent = true })

-- File operations
vim.keymap.set("n", "<leader>s", "<cmd>w<cr>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit buffer" })

-- Telescope
vim.keymap.set("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
vim.keymap.set("n", "<leader>F", "<cmd>Telescope live_grep<cr>", { desc = "Live grep (text)" })

-- LSP
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Find references" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })

-- Misc
vim.keymap.set("i", "<S-CR>", "<cmd><Esc>o<cr>", { desc = "New line below" })
