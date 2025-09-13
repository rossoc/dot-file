vim.g.lsp_zero_extend_cmp = 0
vim.g.lsp_zero_extend_lspconfig = 0

-- Here is where you configure the autocompletion settings.
local lsp_zero = require("lsp-zero")
local lsp = require('lspconfig')
lsp_zero.extend_cmp()

-- And you can configure cmp even more, if you want to.
local cmp = require("cmp")

cmp.setup({
    formatting = lsp_zero.cmp_format(),
    mapping = cmp.mapping.preset.insert({
        ["<C-h>"] = cmp.mapping.complete(),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
    }),
})

lsp_zero.extend_lspconfig()

lsp_zero.on_attach(function(_, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

require("mason").setup({})
require("mason-lspconfig").setup({
    automatic_enable = {
        "clangd", "gopls", "cmake", "ts_ls", "lua_ls"
    }
})

require("lsp.rust")
require("lsp.tex")
require("lsp.haskell")


lsp.jdtls.setup {
    settings = {
        java_home = "/Library/Java/JavaVirtualMachines/jdk-21.jdk/Contents/Home"
    }
}

lsp.harper_ls.setup({
    settings = {
        ["harper-ls"] = {
            userDictPath = "~/.config/dict.txt",
        }
    },
    filetypes = { "typst", "markdown" }
})
