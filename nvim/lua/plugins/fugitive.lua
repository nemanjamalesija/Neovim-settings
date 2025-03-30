return {
  "tpope/vim-fugitive",
  event = "VeryLazy",
  config = function()
    vim.keymap.set("n", "<leader>gs", ":Git status<CR>", { desc = "[G]it [S]tatus" })
    vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", { desc = "[G]it [B]lame" })
  end,
}
