local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "emmet_ls", "mdx_analyzer", "tailwindcss" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.astro.setup {
  init_options = {
    typescript = {
      tsdk = vim.fs.normalize "~/.local/share/nvim/mason/packages/typescript-language-server/node_modules/typescript/lib",
    },
  },
}

lspconfig.eslint.setup {
  on_attach = function(_, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  root_dir = lspconfig.util.find_git_ancestor,
}

lspconfig.denols.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
  init_options = {
    lint = true,
  },
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern "package.json",
  single_file_support = false,
}
