local lsp = require("lsp-zero")

lsp.preset("recommended")
lsp.ensure_installed({
    "tsserver",
    "eslint",
    "gopls",
    "golangci_lint_ls",
    "yamlls",
    "volar"
})
lsp.setup()
