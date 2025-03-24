local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import/override with your plugins
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.ui.mini-animate" },
    { import = "lazyvim.plugins.extras.lang.vue" },
    { import = "lazyvim.plugins.extras.coding.luasnip" },
    { import = "lazyvim.plugins.extras.linting.eslint" },

    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
          ensure_installed = {
            "lua",
            "vim",
            "vimdoc",
            "query",
            "php",
            "html",
            "css",
            "scss",
            "javascript",
            "typescript",
            "vue",
          },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
          auto_install = false,
          modules = {},
          ignore_install = {},
        })
      end,
    },
    { "williamboman/mason.nvim" },

    {
      "williamboman/mason-lspconfig.nvim",
      config = function()
        -- Mason LSPConfig setup
        require("mason-lspconfig").setup({
          -- list of servers for mason to install
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
          -- auto-install configured servers (with lspconfig)
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
            -- Enable code action on save (equivalent to VS Code's lsp_code_actions_on_save)
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              callback = function()
                -- Run eslint fix on save (equivalent to source.fixAll.eslint: true)
                vim.cmd("EslintFixAll")
              end,
            })
          end,
          settings = {
            -- You can add specific eslint settings here if needed
          },
        })
        lspconfig.stylelint_lsp.setup({
          on_attach = function(client, bufnr)
            -- Enable formatting on save
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              callback = function()
                -- Use LSP formatting instead of trying to call Stylelint directly
                vim.lsp.buf.format({
                  filter = function(client)
                    -- Only use stylelint for formatting
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

        lspconfig.volar.setup({
          -- add filetypes for typescript, javascript and vue
          filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
          init_options = {
            vue = {
              -- disable hybrid mode
              hybridMode = false,
            },
          },
        })
      end,
    },

    -- { import = "lazyvim.plugins.extras.formatting.prettier" },
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      opts = { enable = true },
    },
    {
      "nvim-tree/nvim-tree.lua",
      version = "*",
      lazy = false,
      dependencies = {
        "nvim-tree/nvim-web-devicons",
      },
      config = function()
        require("nvim-tree").setup({
          sort = {
            sorter = "case_sensitive",
          },
          view = {
            width = 40,
          },
          renderer = {
            group_empty = true,
          },
          filters = {
            dotfiles = true,
          },
        })
      end,
    },
    { "akinsho/toggleterm.nvim", version = "*", config = true },
    { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" }, cmd = "Telescope" },
    { import = "plugins" },
  },
  defaults = {
    lazy = false,
    version = false,
  },
  install = { colorscheme = { "monokai" } },
  checker = {
    enabled = true,
    notify = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
      },
    },
  },
}
