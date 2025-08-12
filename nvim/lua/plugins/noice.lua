return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        {
            "rcarriga/nvim-notify",
            config = function()
                require("notify").setup({
                    stages = "fade",
                    render = "minimal",
                })
            end,
        },
    },
    opts = {
        lsp = {
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
            },
        },
        notify = {
            enabled = true,
            view = "notify",
        },
        cmdline = {
            view = "cmdline",

            format = {
                search_down = {
                    view = "cmdline",
                },
                search_up = {
                    view = "cmdline",
                },
            },
        },
        views = {
            notify = {
                backend = "notify",
                fallback = "mini",
                format = "notify",
                replace = false,
                merge = false,
                win_options = {
                    winblend = 0,
                    wrap = true,
                },
                size = {
                    width = "auto",
                    height = "auto",
                },
                position = {
                    row = 1,
                    col = -2,
                },
            },
        },
        routes = {
            {
                filter = {
                    event = "notify",
                },
                view = "notify",
                opts = {
                    timeout = 3000,
                    title = "",
                    position = {
                        row = 1,
                        col = -2,
                    },
                },
            },
        },
    },
}
