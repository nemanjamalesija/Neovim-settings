return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({
        git = {
          enable = false,
        },
        sort = {
          sorter = "case_sensitive",
        },
        view = {
          width = 40,
        },
        -- renderer = {
        --   group_empty = true,
        -- },
        filters = {
          dotfiles = false,
          custom = { "^.DS_Store$", "^node_modules$" },
        },
      })
    end,
  },
}
