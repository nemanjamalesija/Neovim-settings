return {
    "mg979/vim-visual-multi",
    branch = "master",
    init = function()
        vim.g.VM_maps = {
            ["Add Cursor Down"] = "<C-j>",
            ["Add Cursor Up"] = "<C-k>",
        }
    end,
}
