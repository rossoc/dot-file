require("config.util")

Map("n", "<leader>w", function()
    vim.cmd("w")
    vim.lsp.buf.format()
end)
Map("n", "<leader>q", ":q!<CR>")
Map("n", "<leader>e", ":Ex<CR>")
Map("n", "<leader>v", ":vsplit<CR><C-w>w")
Map("n", "<C-w>=", "50<C-w>>")
Map("n", "<C-w>-", "50<C-w><")
Map("n", "<C-d>", "<C-d>zz")
Map("n", "<C-u>", "<C-u>zz")
Map("n", "n", "nzzzv")
Map("n", "N", "Nzzzv")
Map("n", "<leader>y", '"+y')

Map("x", "<leader>p", '"_dP')

Map("v", "J", ":m '>+1<CR>gv=gv")
Map("v", "K", ":m '<-2<CR>gv=gv")
Map("v", "<leader>y", '"+y')

Map("n", "mc", Compile)
Map("n", "mr", Run)
Map("n", "mt", Test)
Map("n", "mh", ":! make -f /Users/carlorosso/.config/Makefile help<CR>")

Map("t", "<C-[>", "<C-\\><C-n>")
