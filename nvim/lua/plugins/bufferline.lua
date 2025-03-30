return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers", -- set to "tabs" to only show tabpages instead
          style_preset = require("bufferline").style_preset.bufferline, -- or bufferline.style_preset.minimal,
          buffer_close_icon = "󰅖",
          modified_icon = "● ",
          close_icon = " ",
          left_trunc_marker = " ",
          right_trunc_marker = " ",
          tab_size = 18,
          diagnostics = false,
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              text_align = "center",
              separator = true,
            },
          },
          show_buffer_icons = false,
          show_buffer_close_icons = false,
          show_tab_indicators = true,
          --[[   separator_style = "slope", ]]
          always_show_bufferline = true,
        },

        highlights = {
          fill = {
            bg = "#fdf6e3",
          },
          -- buffer_selected = {
          --   fg = "#ffcc00",
          --   bold = true,
          --   italic = false,
          -- },
        },
      })

      -- Alternative method using `vim.cmd`
      -- vim.cmd([[
      --   hi BufferLineModified guifg=#fd9621 gui=underline
      --   hi BufferLineModifiedVisible guifg=#fd9621 gui=underline
      --   hi BufferLineModifiedSelected guifg=#fd9621 gui=underline
      -- ]])
    end,
  },
}
    end,
  },
}
