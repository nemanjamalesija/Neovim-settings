return {
    {
        "catppuccin/nvim",
        name = "catppuccin-mocha",

        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
                transparent_background = true,
            })
            --[[ vim.cmd.colorscheme("catppuccin-mocha") ]]
        end,
    },
    {
        "folke/tokyonight.nvim",
        name = "tokyonight",

        config = function()
            require("tokyonight").setup({
                transparent = true,
            })
            -- vim.cmd.colorscheme("tokyonight")
        end,
    },
    {
        "neanias/everforest-nvim",
        lazy = false,
        -- priority = 1000,
        config = function()
            local config = {
                background = "medium",
                ui_contrast = "high",
                on_highlights = function(highlight_groups, palette)
                    highlight_groups["@variable.parameter"] = { fg = "#E69875" }
                end,
            }

            if vim.o.background == "dark" then
                config.transparent_background_level = 1
            end

            require("everforest").setup(config)
            -- vim.cmd.colorscheme("everforest")
        end,
    },
    {
        "polirritmico/monokai-nightasty.nvim",
        priority = 1000,
        lazy = false,
        config = function()
            require("monokai-nightasty").setup({
                on_colors = function(colors)
                    -- subtitute purple for yellow
                    colors.purple = "#859900"
                end,
                on_highlights = function(highlights, colors)
                    local fg_text = "#6c6c6c"
                    local bg_poup = "#f9f9f9"
                    local lsp_ref_bg = "#dddddd"
                    local cursor_line_bg = "#f6f6f6"
                    local sublime_blue = "#2aa198"
                    local sublime_blue_dark = "#4791e4"
                    local red = "#ff005f"
                    local purple_subtitute_yellow = "#8da101"
                    local everforest_pink = "#df69ba"

                    highlights.String = { fg = sublime_blue }
                    highlights.sassVariable = { fg = fg_text }
                    highlights.StorageClass = { fg = sublime_blue_dark }

                    highlights.sassDefinition = { fg = fg_text }
                    highlights.sassCssAttribute = { fg = colors.green }

                    highlights["@variable"] = { fg = fg_text }
                    highlights["@variable.member"] = { fg = sublime_blue_dark }
                    highlights["@tag.attribute"] = { fg = purple_subtitute_yellow }
                    highlights["@property.scss"] = { fg = fg_text }
                    highlights["@lsp"] = { fg = fg_text }
                    highlights["@variable.builtin"] = { fg = colors.red }
                    highlights["@constant.builtin"] = { fg = everforest_pink }
                    highlights["@boolean"] = { fg = everforest_pink }

                    highlights.NormalFloat = { bg = bg_poup }
                    highlights.FloatBorder = { bg = bg_poup, fg = fg_text }

                    highlights.TelescopeNormal = { bg = bg_poup, fg = fg_text }
                    highlights.TelescopeBorder = { bg = bg_poup, fg = fg_text }

                    highlights.DiagnosticVirtualTextError = { fg = colors.error, bg = "NONE" }
                    highlights.DiagnosticVirtualTextWarn = { fg = colors.warning, bg = "NONE" }
                    highlights.DiagnosticVirtualTextInfo = { fg = colors.info, bg = "NONE" }
                    highlights.DiagnosticVirtualTextHint = { fg = colors.hint, bg = "NONE" }

                    highlights.LspReferenceText = { bg = lsp_ref_bg }
                    highlights.LspReferenceRead = { bg = lsp_ref_bg }
                    highlights.LspReferenceWrite = { bg = lsp_ref_bg }
                end,
            })
            vim.cmd.colorscheme("monokai-nightasty")
        end,
    },
}
