local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require 'lspconfig'

-- TODO: check this out later https://github.com/pmizio/typescript-tools.nvim

lspconfig.ts_ls.setup {
  capabilities = capabilities,
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        -- location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
        location = "/Users/unnsteinngardarsson/.nvm/versions/node/v18.12.1/lib/node_modules/@vue/typescript-plugin",
        languages = { "javascript", "typescript", "vue" },
      },
    },
  },
  filetypes = {
    "javascript",
    "typescript",
    "vue",
  },
}

lspconfig.volar.setup {
  capabilities = capabilities,
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
}
