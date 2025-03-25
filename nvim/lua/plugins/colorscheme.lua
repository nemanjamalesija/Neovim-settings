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
    opts = function()
      local palette = {
        -- Background colors
        bg = "#1a1b1e",
        dark = "#1a1c23",

        -- Accent colors
        red = "#ff6188",
        orange = "#fd9621",
        yellow = "#e7db74",
        cyan = "#6be2f4",
        green = "#a9e34b",
        teal = "#4dd499",

        -- Text colors
        white = "#e7e7e7",
      }

      return {
        transparent_background = false,
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
            ["@variable.builtin"] = { fg = palette.red },
            ["@variable.parameter"] = { fg = palette.orange },
            ["@string.scss"] = { fg = palette.yellow },
            ["@string"] = { fg = palette.yellow },
            ["@string.yaml"] = { fg = palette.yellow },
            ["@character.special"] = { fg = palette.red },
          }
        end,
        overridePalette = function(filter)
          return {
            background = palette.bg,
            dark2 = palette.dark,
            dark1 = palette.dark,
            accent1 = palette.red,
            accent5 = palette.cyan,
            accent4 = palette.green,
            accent6 = palette.teal,
            text = palette.white,
          }
        end,
      }
    end,
    config = function(_, opts)
      local monokai = require("monokai-pro")
      monokai.setup(opts)
      monokai.load()

      vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#5b595c" })
    end,
  },
}
