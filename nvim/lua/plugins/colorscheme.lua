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
            lotusWhite0 = "#fef9eb",
            lotusWhite1 = "#dcd5ac",
            lotusWhite2 = "#e5ddb0",
            lotusWhite3 = "#f2ecbc",
            lotusWhite4 = "#d7e3d8",
            lotusWhite4 = "#d7e3d8",
            lotusWhite5 = "#e4d794",
            lotusViolet1 = "#a09cac",
            lotusViolet2 = "#766b90",
            lotusViolet3 = "#c9cbd1",
            lotusViolet4 = "#624c83",
            lotusBlue1 = "#fef9eb",
            lotusBlue2 = "#fbe7bd",
            lotusBlue3 = "#fbe7bd",
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
            lotusAqua = "#268bd2",
            lotusAqua2 = "#6693bf",
            lotusTeal1 = "#268bd2",
            lotusTeal2 = "#268bd2",
            lotusTeal3 = "#657b83",
            lotusCyan = "#d7e3d8",
            sublimeCyan = "#2aa198",
            sublimeGreen = "#007700",
            sublimeYellow = "#859900",
            sublimeOrange = "#cf7c00",
            highlightLine = "#fbe7bd",
          },
          theme = {
            wave = {},
            lotus = {
              ui = {
                bg = "#fdf6e3",
                bg_gutter = "#eee8d5",
              },
            },
            dragon = {},
            all = {},
          },
        },
        overrides = function(colors) -- add/modify highlights
          return {
            Cursor = { fg = "#fdf6e3", bg, bg = "#fdf6e3" },
            CursorLine = { bg = "#eee8d5" },
            Search = { bg = colors.palette.highlightLine, fg = colors.palette.lotusInk1, bold = true },
            IncSearch = { bg = colors.palette.highlightLine, fg = colors.palette.lotusWhite1 },
            WinSeparator = { fg = colors.palette.lotusAqua },

            ["@constant"] = { fg = colors.palette.lotusInk1 },
            ["@constant.builtin"] = { fg = colors.palette.lotusAqua, bold = true, italic = true },
            ["@tag"] = { fg = colors.palette.lotusAqua, bold = false },
            ["@punctuation"] = { fg = colors.palette.lotusInk1 },
            ["@punctuation.special"] = { fg = colors.palette.lotusInk1 },
            ["@punctuation.bracket"] = { fg = colors.palette.lotusInk1 },
            ["@punctuation.delimiter"] = { fg = colors.palette.lotusInk1 },
            ["@function"] = { fg = colors.palette.sublimeGreen },
            ["@lsp.typemod.function.readonly"] = { fg = colors.palette.sublimeGreen, bold = false },
            ["@boolean"] = { fg = colors.palette.lotusAqua, bold = true, italic = true },
            ["@number"] = { fg = colors.palette.lotusAqua, bold = true },
            ["@type"] = { fg = colors.palette.sublimeYellow, italic = true },
            ["@type.builtin"] = { fg = colors.palette.sublimeYellow, italic = true },
            ["@lsp.type.builtinConstant"] = { fg = colors.palette.lotusAqua, bold = true, italic = true },
            ["@variable.builtin"] = { fg = colors.palette.lotusAqua },
            ["@variable.parameter"] = { fg = colors.palette.sublimeOrange },
            ["@operator"] = { fg = colors.palette.lotusInk1 },
            ["@variable.builtin"] = { fg = colors.palette.lotusViolet4, bold = true },
            ["@keyword"] = { fg = colors.palette.lotusRed, bold = true },
            ["@keyword.operator"] = { bold = true, fg = colors.palette.lotusRed },
            ["@keyword.conditional"] = { bold = true, fg = colors.palette.lotusRed },
            ["@keyword.exception"] = { bold = true, fg = colors.palette.lotusRed },
            ["@keyword.import"] = { bold = true, fg = colors.palette.lotusRed },
            ["@keyword.export"] = { bold = true },
            ["@keyword.return"] = { bold = true },
            ["@string"] = { fg = colors.palette.sublimeCyan },
            ["@string.scss"] = { fg = colors.palette.sublimeCyan },
            ["@string.yaml"] = { fg = colors.palette.sublimeCyan },
            ["@character.special"] = { fg = colors.palette.red },

            DiagnosticVirtualTextError = { bg = "#ffcccc", italic = true },
            DiagnosticVirtualTextWarn = { bg = "#ffddaa", italic = true },
            DiagnosticVirtualTextInfo = { bg = "#aaccee", italic = true },
            DiagnosticVirtualTextHint = {
              bg = "#d5f0e2", -- Light greenish background for hints
              fg = colors.palette.lotusInk1, -- Main text color
              italic = true, -- Italics for emphasis
            },

            DiagnosticSignError = { fg = "#eee8d5", bold = true },
            DiagnosticSignWarn = { fg = "#eee8d5" },
            DiagnosticSignInfo = { fg = "#eee8d5" },
            DiagnosticSignHint = { fg = "#eee8d5" },
          }
        end,
        theme = "lotus", -- This is the main theme setting
      })
      vim.cmd("colorscheme kanagawa-lotus")
    end,
  },
  -- {
  --   "loctvl842/monokai-pro.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = function()
  --     local palette = {
  --       -- Background colors
  --       bg = "#1a1b1e",
  --       dark = "#1a1c23",
  --
  --       -- Accent colors
  --       red = "#ff6188",
  --       orange = "#fd9621",
  --       yellow = "#e7db74",
  --       yellowMonokai = "#ffd866",
  --       cyan = "#6be2f4",
  --       green = "#a9e34b",
  --       teal = "#4dd499",
  --
  --       -- Text colors
  --       white = "#e7e7e7",
  --     }
  --
  --     return {
  --       transparent_background = false,
  --       filter = "classic", -- classic | octagon | pro | machine | ristretto | spectrum
  --       inc_search = "background", -- underline | background
  --       background_clear = {
  --         "nvim-tree",
  --         -- "neo-tree",
  --         "bufferline",
  --         "telescope",
  --         "toggleterm",
  --       },
  --       plugins = {
  --         bufferline = {
  --           underline_selected = true,
  --           underline_visible = false,
  --           underline_fill = true,
  --           bold = false,
  --         },
  --         indent_blankline = {
  --           context_highlight = "pro", -- default | pro
  --           context_start_underline = true,
  --         },
  --       },
  --       override = function(c)
  --         return {
  --           MatchParen = { fg = palette.yellowMonokai, bg = palette.dark, bold = true },
  --
  --           ["@variable.builtin"] = { fg = palette.red },
  --           ["@variable.parameter"] = { fg = palette.orange },
  --           ["@string.scss"] = { fg = palette.yellow },
  --           ["@string"] = { fg = palette.yellow },
  --           ["@string.yaml"] = { fg = palette.yellow },
  --           ["@character.special"] = { fg = palette.red },
  --         }
  --       end,
  --       overridePalette = function(filter)
  --         return {
  --           background = palette.bg,
  --           dark2 = palette.dark,
  --           dark1 = palette.dark,
  --           accent1 = palette.red,
  --           accent3 = palette.green,
  --           accent4 = palette.green,
  --           accent5 = palette.cyan,
  --           accent6 = palette.teal,
  --           text = palette.white,
  --         }
  --       end,
  --     }
  --   end,
  --   config = function(_, opts)
  --     local monokai = require("monokai-pro")
  --     monokai.setup(opts)
  --     monokai.load()
  --
  --     vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#5b595c" })
  --   end,
  -- },
}
