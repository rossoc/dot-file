local lsp = require("lsp-zero")

vim.lsp.config['texlab'] = {
    on_attach = lsp.on_attach,
    texlab = {
        auxDirectory = ".",
        bibtexFormatter = "texlab",
        build = {
            args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
            executable = "pdflatex",
            forwardSearchAfter = false,
            onSave = false
        },
        chktex = {
            onEdit = true,
            onOpenAndSave = false
        },
        diagnosticsDelay = 300,
        formatterLineLength = 80,
        forwardSearch = {
            args = {}
        },
        latexFormatter = "latexindent",
        latexindent = {
            modifyLineBreaks = false
        }
    }
}
