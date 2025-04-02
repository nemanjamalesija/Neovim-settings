return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers",
          style_preset = require("bufferline").style_preset.bufferline,
          modified_icon = "● ",
          tab_size = 18,
          diagnostics = false,
          mappings = true,
          separator_style = "slope",
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              text_align = "center",
              separator = false,
            },
          },
          show_buffer_icons = false,
          show_buffer_close_icons = false,
          show_tab_indicators = true,
          always_show_bufferline = true,
        },
        -- highlights = {
        --   fill = {
        --     bg = "#fdf6e3",
        --     fg = "#fdf6e3",
        --   },
        -- },
      })
    end,
  },
}
