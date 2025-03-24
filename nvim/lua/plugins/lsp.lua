return {
  { "williamboman/mason.nvim" },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "ts_ls",
          "volar",
          "html",
          "cssls",
          "tailwindcss",
          "somesass_ls",
          "lua_ls",
          "emmet_ls",
          "stylelint_lsp",
        },

        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
    config = function()
      local lspconfig = require("lspconfig")

      lspconfig.eslint.setup({
        on_attach = function(client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              vim.cmd("EslintFixAll")
            end,
          })
        end,
        settings = {
          -- add any settings here
        },
      })
      lspconfig.stylelint_lsp.setup({
        on_attach = function(client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              -- Use LSP formatting instead of trying to call Stylelint directly
              vim.lsp.buf.format({
                filter = function(client)
                  return client.name == "stylelint_lsp"
                end,
                async = false, -- Important for BufWritePre
              })
            end,
          })
        end,
        settings = {
          stylelintplus = {
            -- Enable auto-fix on save
            autoFixOnSave = true,
            autoFixOnFormat = true,
          },
        },
        filetypes = { "css", "scss", "less", "sass" },
      })

      -- TypeScript LSP server
      lspconfig.ts_ls.setup({})

      -- Volar server
      lspconfig.volar.setup({
        filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
        init_options = {
          vue = {
            hybridMode = false,
          },
        },
      })
    end,
  },
}
