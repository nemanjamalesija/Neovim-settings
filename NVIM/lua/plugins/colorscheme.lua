return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "night" },
  },

  {
    "catppuccin/nvim",
    lazy = true,
  },

  {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent_background = false,
      -- devicons = true,
      filter = "classic", -- classic | octagon | pro | machine | ristretto | spectrum
      inc_search = "background", -- underline | background
      background_clear = {
        "nvim-tree",
        -- "neo-tree",
        "bufferline",
        "telescope",
        "toggleterm",
      },
      plugins = {
        bufferline = {
          underline_selected = true,
          underline_visible = false,
          underline_fill = true,
          bold = false,
        },
        indent_blankline = {
          context_highlight = "pro", -- default | pro
          context_start_underline = true,
        },
      },
      override = function(c)
        return {

          DashboardRecent = { fg = c.base.magenta },
          DashboardProject = { fg = c.base.blue },
          DashboardConfiguration = { fg = c.base.white },
          DashboardSession = { fg = c.base.green },
          DashboardLazy = { fg = c.base.cyan },
          DashboardServer = { fg = c.base.yellow },
          DashboardQuit = { fg = c.base.red },
          IndentBlanklineChar = { fg = c.base.dimmed4 },
          NeoTreeStatusLine = { link = "StatusLine" },
          ["@variable.builtin"] = { fg = "#ff6188" },
          ["@variable.parameter"] = { fg = "#fd9621" },
          ["@string.scss"] = { fg = "#e7db74" },
          ["@string"] = { fg = "#e7db74" },
          ["@string.yaml"] = { fg = "#e7db74" },
          ["@character.special"] = { fg = "#ff6188" },
        }
      end,
      overridePalette = function(filter)
        return {
          background = "#1a1b1e",
          dark2 = "#1a1c23",
          dark1 = "#1a1c23",
          accent1 = "#ff6188",
          accent5 = "#6be2f4",
          accent4 = "#a9e34b",
          accent6 = "#4dd499",
          text = "#e7e7e7",
        }
      end,
    },
    config = function(_, opts)
      local monokai = require("monokai-pro")
      monokai.setup(opts)
      monokai.load()
    end,
  },
}
