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
        presets = {
            command_palette = true,
            long_message_to_split = false,
            inc_rename = true,
            lsp_doc_border = false,
        },
        notify = {
            enabled = true,
            view = "notify",
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
