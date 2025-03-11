local plugins = {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
      {
        "williamboman/mason-lspconfig.nvim",
        opts = {
          handlers = {
            ["jdtls"] = function()
              require("java").setup {
                root_markers = { ".git" },
                jdk = { auto_install = false },
              }
            end,
          },
        },
      },
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
        "http",
        "html",
        "css",
        "astro",
        "json",
        "graphql",
        "go",
        -- game dev
        "gdscript",
        "godot_resource",
        "gdshader",
        -- high level
        "java",
        "python",
        "c_sharp",
        "javascript",
        "typescript",
        "tsx",
        -- low level
        "c",
        "cpp",
      },
      indent = { enable = true, disable = { "gdscript" } },
    },
  },
  { "habamax/vim-godot", event = "VimEnter" },
  {
    "williamboman/mason.nvim",
    dependencies = { "nvim-java/nvim-java" },
    opts = {
      ensure_installed = {
        "astro-language-server",
        "lua-language-server",
        "html-lsp",
        "prettier",
        "stylua",
        "emmet-ls",
        "typescript-language-server",
        "clangd",
      },
      registries = {
        "github:nvim-java/mason-registry",
        "github:mason-org/mason-registry",
      },
    },
  },
  {
    "tpope/vim-fugitive",
    lazy = false,
  },
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
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
      { "tpope/vim-dotenv", lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
      "Dotenv",
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
  {
    "razak17/tailwind-fold.nvim",
    opts = {},
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = { "html", "svelte", "astro", "vue", "typescriptreact", "php", "blade" },
  },
  {
    "pysan3/autosession.nvim",
    lazy = false,
    dependencies = { "mhinz/vim-startify" },
    opts = {
      restore_on_setup = true,
      warn_on_setup = true,
      autosave_on_quit = true,
    },
  },
  {
    "mistweaverco/kulala.nvim",
    config = function()
      -- Setup is required, even if you don't pass any options
      require("kulala").setup()
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      require("dapui").setup()
    end,
  },
}

return plugins
