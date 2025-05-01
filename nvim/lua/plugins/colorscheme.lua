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
                end,
            })
            vim.cmd.colorscheme("monokai-nightasty")
        end,
    },
}

