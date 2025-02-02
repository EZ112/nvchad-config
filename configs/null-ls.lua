local null_ls = require "null-ls"
local lspconfig_util = require "lspconfig.util"

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local eslint_cwd = function(params)
  return lspconfig_util.root_pattern "tsconfig.json" (params.bufname)
end

local eslint_condition = function(utils)
  return utils.root_has_file { "package.json" }
end

local deno_condition = function(utils)
  return utils.root_has_file { "deno.json", "deno.jsonc" }
end

local sources = {
  formatting.prettierd.with { extra_filetypes = { "astro" } },
  formatting.stylua,
  formatting.deno_fmt.with { condition = deno_condition },
  formatting.eslint_d.with { cwd = eslint_cwd, condition = eslint_condition },
  formatting.gofumpt,
  formatting.csharpier,
  formatting.clang_format,
  formatting.gdformat,
  lint.deno_lint.with { condition = deno_condition },
  lint.eslint_d.with { cwd = eslint_cwd, condition = eslint_condition },
  lint.gdlint,
  lint.golangci_lint,
  lint.golangci_lint,
  code_actions.eslint_d.with { cwd = eslint_cwd },
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}
