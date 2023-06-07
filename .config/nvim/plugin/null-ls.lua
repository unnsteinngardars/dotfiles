local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        -- TODO: test out go formatting
        -- null_ls.builtins.formatting.goimports
        -- null_ls.builtins.formatting.gofumpt
        -- null_ls.builtins.formatting.gofmt
        null_ls.builtins.formatting.yamlfmt,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        -- null_ls.builtins.completion.spell,
        null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.formatting.dart_format,
        null_ls.builtins.formatting.goimports,
        -- null_ls.builtins.code_actions.gitsigns,
    },
    -- you can reuse a shared lspconfig on_attach callback here
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
            -- TODO: remove this yaml check when some formatters for helm charts have been added.
            print(filetype)
            if filetype ~= "yaml" and filetype ~= "yml" then
                vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = augroup,
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format({ bufnr = bufnr })
                    end,
                })
            end
        end
    end,
})
