vim.g.mapleader = " "
--vim.opt.guicursor = ""
vim.o.number = true
vim.o.relativenumber = true
vim.o.so = 12

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.smarttab = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.cursorline = true
--vim.opt.autochdir = true
--

vim.opt.autowrite = false

vim.opt.textwidth = 80
vim.opt.wrap = true
vim.opt.smartcase = true

vim.opt.colorcolumn = "80"

vim.g.loaded_perl_provider = 0
