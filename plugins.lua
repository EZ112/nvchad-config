local plugins = {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults
        "vim",
        "lua",
        -- web dev
        "html",
        "css",
        "astro",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "graphql",
        "python",
        -- low level
        "c",
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "astro-language-server",
        "lua-language-server",
        "html-lsp",
        "prettier",
        "stylua",
        "emmet-ls",
        "typescript-language-server",
      },
    },
  },
  {
    "tpope/vim-fugitive",
    lazy = false,
  },
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    lazy = false,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/popup.nvim",
      "nvim-telescope/telescope-media-files.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    cmd = "Telescope",
    init = function()
      require("core.utils").load_mappings "telescope"
    end,

    opts = function()
      local default_opts = require "plugins.configs.telescope"
      local custom_opts = require "custom.configs.telescope"
      return vim.tbl_deep_extend("force", default_opts, custom_opts)
    end,

    config = function(_, opts)
      dofile(vim.g.base46_cache .. "telescope")
      local telescope = require "telescope"
      telescope.setup(opts)

      -- load extensions
      for _, ext in ipairs(opts.extensions_list) do
        telescope.load_extension(ext)
      end
    end,
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
      { "tpope/vim-dotenv", lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      require "custom.configs.dadbod-ui"
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "kristijanhusak/vim-dadbod-completion",
      },
    },
    init = function()
      local autocmd = vim.api.nvim_create_autocmd
      autocmd({ "FileType" }, { pattern = "dbout", command = "setlocal nofoldenable" })
    end,
    opts = function()
      return require "plugins.configs.cmp"
    end,
    config = function(_, opts)
      local cmp = require "cmp"
      cmp.setup(opts)
      cmp.setup.filetype({ "sql", "mysql", "psql" }, {
        sources = {
          { name = "vim-dadbod-completion" },
        },
      })
    end,
  },
}

return plugins
