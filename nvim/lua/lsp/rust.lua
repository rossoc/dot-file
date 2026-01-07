local lsp = require("lsp-zero")

vim.lsp.config['rust_analyzer'] = {
    on_attach = lsp.on_attach,
    settings = {
        ["rust_analyzer"] = {
            formatting = {
                dynamicRegistration = true
            },
            hover = {
                contentFormat = { "markdown", "plaintext" },
                dynamicRegistration = true
            },
        },
    },
}
