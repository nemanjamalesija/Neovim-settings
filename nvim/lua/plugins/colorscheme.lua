    {
        "polirritmico/monokai-nightasty.nvim",
        lazy = true,
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
                    local sublime_blue = "#2aa198"
                    local sublime_blue_dark = "#4791e4"
                    local purple_subtitute_yellow = "#8da101"
                    local everforest_pink = "#df69ba"

                    highlights.String = { fg = sublime_blue }
                    highlights.Constant = { fg = sublime_blue }

                    highlights.cssValueNumber = { fg = everforest_pink }
                    highlights.cssBraces = { fg = fg_text }

                    highlights.sassVariable = { fg = colors.black }
                    highlights.StorageClass = { fg = fg_text }
                    highlights.sassClass = { fg = colors.blue }
                    highlights.sassDefinition = { fg = colors.blue }
                    highlights.sassCssAttribute = { fg = colors.green }
                    highlights["@property.scss"] = { fg = fg_text }

                    highlights["@variable"] = { fg = fg_text }
                    highlights["@variable.member"] = { fg = sublime_blue_dark }
                    highlights["@punctuation.bracket"] = { fg = fg_text }
                    highlights["@tag.attribute"] = { fg = purple_subtitute_yellow }
                    highlights["@lsp"] = { fg = fg_text }
                    highlights["@variable.builtin"] = { fg = purple_subtitute_yellow, bold = true }
                    highlights["@constant.builtin"] = { fg = everforest_pink }
                    highlights["@number"] = { fg = everforest_pink }
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
            -- vim.cmd.colorscheme("monokai-nightasty")
        end,
    },
