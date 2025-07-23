-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- -- Add this to ~/.config/nvim/lua/config/keymaps.lua (if using LazyVim)
-- or add to your init.lua if you have a different setup
--
-- File explorer
vim.keymap.set("n", "<leader>o", "<cmd>NvimTreeFindFileToggle<cr>", { desc = "Toggle NvimTree (reveal file)" })

-- Close NvimTree
vim.api.nvim_create_autocmd("FileType", {
    pattern = "NvimTree",
    callback = function()
        vim.keymap.set("n", "<Esc>", "<cmd>NvimTreeClose<CR>", { buffer = true, silent = true })
    end,
})

-- File operations
vim.keymap.set("n", "<leader>s", "<cmd>w<cr>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit buffer" })

-- Find and focus directory
function find_directory_and_focus()
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")

    local function open_nvim_tree(prompt_bufnr, _)
        actions.select_default:replace(function()
            local api = require("nvim-tree.api")

            actions.close(prompt_bufnr)
            local selection = action_state.get_selected_entry()
            api.tree.open()
            api.tree.find_file(selection.cwd .. "/" .. selection.value)
        end)
        return true
    end

    require("telescope.builtin").find_files({
        find_command = { "fd", "--type", "directory", "--hidden", "--exclude", ".git/*" },
        attach_mappings = open_nvim_tree,
    })
end
vim.keymap.set("n", "<leader>ds", find_directory_and_focus)

-- Telescope/files
-- Find files
vim.keymap.set("n", "<leader><leader>", function()
    require("telescope.builtin").find_files({
        hidden = true,
        no_ignore = true,
        follow = true,
        find_command = {
            "fd",
            "--type",
            "f",
            "--hidden",
            "--follow",
            "--exclude",
            "node_modules",
            "--exclude",
            "dist",
            "--exclude",
            ".git",
            "--exclude",
            "build",
            "--exclude",
            "coverage",
        },
    })
end, { desc = "Find files (clean search, exclude dist/node_modules/etc)" })

-- Grep find all
vim.keymap.set("n", "<leader>F", function()
    require("telescope.builtin").live_grep({
        additional_args = function()
            return {
                "--hidden",
                "--no-ignore",
                "--glob",
                "!**/node_modules/**",
                "--glob",
                "!**/dist/**",
                "--glob",
                "!**/ssr-dist/**",
                "-F", -- Treat query as literal string, not regex
            }
        end,
    })
end, { desc = "Live grep (literal search, exclude junk)" })

-- Fuzzy search in current buffer
vim.keymap.set(
    "n",
    "<leader>f",
    require("telescope.builtin").current_buffer_fuzzy_find,
    { desc = "Fuzzy search in current buffer" }
)

-- Grep find all in specific folder
vim.keymap.set("n", "<leader>fd", function()
    local dir = vim.fn.input("grep directory: ")
    require("telescope.builtin").live_grep({
        search_dirs = { dir },
    })
end, { desc = "live grep in user directory" })

-- Substitute word
vim.keymap.set("n", "<leader>S", ":%s/", { noremap = true, desc = "Substitute word" })

-- LSP
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Find references" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })

-- Bufferline
vim.api.nvim_set_keymap("n", "<M-h>", ":bprevious<CR>", { desc = "Focus buffer left", noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-l>", ":bnext<CR>", { desc = "See buffer on the right", noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-M-h>", ":BufferLineMovePrev<CR>", { desc = "h-buffer", noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-M-l>", ":BufferLineMoveNext<CR>", { desc = "l-buffer", noremap = true, silent = true })
vim.keymap.set("n", "<M-w>", function()
    require("mini.bufremove").delete(0, false)
end, { desc = "Delete buffer" }) -- WezTerm Alt + w

vim.keymap.set("n", "∑", function()
    require("mini.bufremove").delete(0, false)
end, { desc = "Delete buffer" }) -- Ghost terminal interprets alt as ∑

vim.keymap.set("n", "<leader>r", [["_ddP]], { desc = "Replace current line with yanked text" })

vim.keymap.set("n", "<leader>ts", function()
    if vim.o.background == "dark" then
        vim.o.background = "light"
        print("Switched to light mode")
    else
        vim.o.background = "dark"
        print("Switched to dark mode")
    end
end, { desc = "Toggle between light and dark mode" })
