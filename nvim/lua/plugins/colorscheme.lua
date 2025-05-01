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
                    colors.purple = "#859900"
                end,
                on_highlights = function(highlights, colors)
                    highlights.String = { fg = "#2aa198" }
                    highlights["@variable"] = { fg = "#5c5c5c" }
                    highlights["@variable.member"] = { fg = "#5c5c5c" }
                    highlights["@variable.builtin"] = { fg = "#ff005f" }
                    highlights.NormalFloat = { bg = "#f9f9f9" }
                    highlights.FloatBorder = { bg = "#f9f9f9", fg = "#5c5c5c" }
                    highlights.CursorLine = { bg = "#ececec" }

                    highlights.TelescopeNormal = { bg = "#f9f9f9", fg = "#5c5c5c" }
                    highlights.TelescopeBorder = { bg = "#f9f9f9", fg = "#5c5c5c" }

                    highlights.DiagnosticVirtualTextError = { fg = colors.error, bg = "NONE" }
                    highlights.DiagnosticVirtualTextWarn = { fg = colors.warning, bg = "NONE" }
                    highlights.DiagnosticVirtualTextInfo = { fg = colors.info, bg = "NONE" }
                    highlights.DiagnosticVirtualTextHint = { fg = colors.hint, bg = "NONE" }

                    local ref_bg = "#dcdcdc"
                    highlights.LspReferenceText = { bg = ref_bg }
                    highlights.LspReferenceRead = { bg = ref_bg }
                    highlights.LspReferenceWrite = { bg = ref_bg }
                end,
            })
            vim.cmd.colorscheme("monokai-nightasty")
        end,
    },
}

