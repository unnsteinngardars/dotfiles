local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require 'lspconfig'
local configs = require 'lspconfig/configs'

lspconfig.gopls.setup {
  capabilities = capabilities,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    }
  }
}


if not configs.golangcilsp then
  configs.golangcilsp = {
    default_config = {
      cmd = { 'golangci-lint-langserver' },
      root_dir = lspconfig.util.root_pattern('.git', 'go.mod'),
      init_options = {
        command = { "golangci-lint", "run", "--enable-all", "--disable", "lll", "--out-format", "json", "--issues-exit-code=1" },
      }
    },
  }
end

lspconfig.golangci_lint_ls.setup {
  filetypes = { 'go', 'gomod' }
}

