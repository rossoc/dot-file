require "setup.plugins"
require("plenary")
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("harpoon")
require("setup.keymap")
require('lspconfig').rust_analyzer.setup({
    on_attach = on_attach,
    settings = {
        ["rust_analyzer"] = {}
    }
})
require("setup.themes")

require('telescope')
require('nvim-treesitter.configs').setup {
  ensure_installed = { "lua", "rust", "toml", "cpp", "python"},
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting=false,
  },
  ident = { enable = true }, 
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}

require('telescope').load_extension('fzf')
require'lspconfig'.clangd.setup{}
require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
}
require'lspconfig'.cmake.setup{}

vim.cmd([[
let g:vimspector_sidebar_width = 85
let g:vimspector_bottombar_height = 15
let g:vimspector_terminal_maxwidth = 70
]])
