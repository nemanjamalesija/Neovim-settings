return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    -- local actions = require("telescope.actions")
    -- local transform_mod = require("telescope.actions.mt").transform_mod

    telescope.setup({
      defaults = {
        layout_strategy = "vertical",
        path_display = { "smart" },
        mappings = {},
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
