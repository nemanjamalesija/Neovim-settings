return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    config = function()
      require("kanagawa").setup({
        colors = {
          palette = {
            lotusInk1 = "#657b83",
            lotusInk2 = "#657b83",
            lotusGray = "#657b83",
            lotusGray2 = "#657b83",
            lotusGray3 = "#716e61",
            lotusWhite0 = "#d5cea3",
            lotusWhite1 = "#dcd5ac",
            lotusWhite2 = "#e5ddb0",
            lotusWhite3 = "#f2ecbc",
            lotusWhite4 = "#e7dba0",
            lotusWhite5 = "#e4d794",
            lotusViolet1 = "#a09cac",
            lotusViolet2 = "#766b90",
            lotusViolet3 = "#c9cbd1",
            lotusViolet4 = "#624c83",
            lotusBlue1 = "#d5cea3",
            lotusBlue2 = "#fbe7bd",
            lotusBlue3 = "#dcd5ac",
            -- lotusBlue4 = "#657b83",
            -- lotusBlue5 = "#e68a00",
            lotusGreen = "#6f894e",
            lotusGreen2 = "#6e915f",
            lotusGreen3 = "#b7d0ae",
            lotusPink = "#b35b79",
            lotusOrange = "#657b83",
            lotusOrange2 = "#657b83",
            lotusYellow = "#77713f",
            lotusYellow2 = "#836f4a",
            lotusYellow3 = "#de9800",
            lotusYellow4 = "#eee8d5",
            lotusRed = "#c84053",
            lotusRed2 = "#d7474b",
            lotusRed3 = "#e82424",
            lotusRed4 = "#d9a594",
            lotusAqua = "#4791e4",
            lotusAqua2 = "#6693bf",
            lotusTeal1 = "#4e8ca2",
            lotusTeal2 = "#4791e4",
            lotusTeal3 = "#657b83",
            lotusCyan = "#d7e3d8",
            sublimeCyan = "#2aa198",
            sublimeGreen = "#007700",
            sublimeOrange = "#e68a00",
            highlightLine = "#fbe7bd",
          },
          theme = {
            wave = {},
            lotus = {
              ui = {
                bg = "#fdf6e3",
                bg_gutter = "#eee8d5",
                bg_sidebar = "#eee8d5",
              },
            },
            dragon = {},
            all = {},
          },
        },
        overrides = function(colors) -- add/modify highlights
          return {
            CursorLine = { bg = "#eee8d5" },
            Search = { bg = colors.palette.highlightLine, fg = colors.palette.lotusInk1, bold = true },
            IncSearch = { bg = colors.palette.highlightLine, fg = colors.palette.lotusWhite1 },
            --[[  CursorLineNr = { fg = "#e98a00", bg = "#eee8d5" }, ]]

            ["@constant"] = { fg = colors.palette.lotusInk1 },
            ["@function"] = { fg = colors.palette.sublimeGreen },
            ["@boolean"] = { bold = false, fg = colors.palette.lotusAqua },
            ["@variable.builtin"] = { fg = colors.palette.lotusRed },
            ["@variable.parameter"] = { fg = colors.palette.sublimeOrange },
            ["@operator"] = { fg = colors.palette.lotusInk1 },
            ["@keyword"] = { fg = colors.palette.lotusRed },
            ["@keyword.operator"] = { bold = false, fg = colors.palette.lotusRed },
            ["@keyword.exception"] = { bold = false },
            ["@string"] = { fg = colors.palette.sublimeCyan },
            ["@string.scss"] = { fg = colors.palette.sublimeCyan },
            ["@string.yaml"] = { fg = colors.palette.sublimeCyan },
            ["@character.special"] = { fg = colors.palette.red },

            DiagnosticVirtualTextError = { bg = "#ffcccc", italic = true },
            DiagnosticVirtualTextWarn = { bg = "#ffddaa", italic = true },
            DiagnosticVirtualTextInfo = { bg = "#aaccee", italic = true },
          }
        end,
        theme = "lotus", -- This is the main theme setting
      })
      vim.cmd("colorscheme kanagawa-lotus")
    end,
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
        yellowMonokai = "#ffd866",
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
            MatchParen = { fg = palette.yellowMonokai, bg = palette.dark, bold = true },

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
            accent3 = palette.green,
            accent4 = palette.green,
            accent5 = palette.cyan,
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
