require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true
    },
    indent = {
        enable = false
    },
    rainbow = {
        enable = true
    },
    autotag = {
        enable = true
    },
    ensure_installed = { "go", "vim", "vue", "help", "javascript", "lua", "http", "json", "markdown", "markdown_inline", "dart" }
}
