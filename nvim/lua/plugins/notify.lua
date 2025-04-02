return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    notify = {
      enabled = true,
      view = "notify",
    },
    views = {},
  },
  dependencies = {
    "rcarriga/nvim-notify",
  },
  config = function()
    vim.notify = require("notify")

    require("notify").setup({
      timeout = 3500,
      max_width = 50,
      height = 20,
      stages = "static",
    })
  end,
}
