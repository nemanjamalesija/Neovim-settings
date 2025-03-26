return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-tree.lua",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")
    local nvim_tree_api = require("nvim-tree.api")

    -- Fast sync: Skip `vim.schedule` and directly reveal the file
    -- local sync_fast = function(prompt_bufnr)
    --   actions.select_default(prompt_bufnr) -- Select file in Telescope
    --   local selected = action_state.get_selected_entry()
    --   if not selected then
    --     return
    --   end

    --   -- Get absolute path (works for most pickers: find_files, git_files, etc.)
    --   local file_path = selected.path or (selected.cwd and selected.cwd .. "/" .. selected.value) or selected.value
    --
    --   -- Immediately reveal in Nvim-Tree (no delay)
    --   if nvim_tree_api.tree.is_visible() then
    --     nvim_tree_api.tree.find_file(file_path)
    --   else
    --     nvim_tree_api.tree.toggle({ focus = false, find_file = true, path = file_path })
    --   end
    -- end

    telescope.setup({
      defaults = {
        file_ignore_patterns = { "node_modules" },
        layout_strategy = "vertical",
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--ignore-case",
        },
      },
    })

    telescope.load_extension("fzf")
  end,
}
