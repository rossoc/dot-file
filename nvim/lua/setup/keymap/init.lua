require("setup.keymap.fn")

local function map(mode, key, fn)
	vim.keymap.set(mode, key, fn)
end

---- harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

map("n", ";<tab>", function()
	ui.toggle_quick_menu()
end)
map("n", ";a", function()
	mark.add_file()
end)
map("n", "<C-n>", function()
	ui.nav_file(1)
end)
map("n", "<C-m>", function()
	ui.nav_file(2)
end)
map("n", "<C-,>", function()
	ui.nav_file(3)
end)

-- telescope
map("n", "<C-f>", ":Telescope find_files<CR>")
map("n", "<leader>f", ":Telescope live_grep<CR>")
map("n", ";g", ":Telescope git_files<CR>")
map("n", ";s", ":Telescope buffers<CR>")
map("n", ";q", ":Telescope quickfixhistory<CR>")
map("n", "<leader>j", ":Telescope jumplist<CR>")

-- useful vim remap
map("n", "<leader>w", function()
	vim.cmd("w")
	vim.lsp.buf.format()
end)
map("n", "<leader>q", ":q!<CR>")
map("n", "<leader>e", ":Ex<CR>")
map("n", "<leader>v", ":vsplit<CR><C-w>w")
map("n", "<C-w>=", "50<C-w>>")
map("n", "<C-w>-", "50<C-w><")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<leader>y", '"+y')

map("x", "<leader>p", '"_dP')

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("v", "<leader>y", '"+y')

-- makefile
map("n", "mc", function()
	Compile()
end)
map("n", "mr", function()
	Make("run")
end)
map("n", "mt", function()
	Make("test")
end)
map("n", "mh", ":! make -f /Users/carlorosso/.config/Makefile help<CR>")

map("n", "<leader>mr", ":! make run<CR>")
map("n", "<leader>mc", ":! make clean<CR>")

-- cargo
map("n", ",b", ":! cargo build<CR>")
map("n", ",r", ":! cargo run<CR>")
map("n", ",t", ":! cargo test<CR>")

-- TroubleToggle
map("n", "<space>t", ":TroubleToggle workspace_diagnostics<CR>")

-- undo tree
map("n", "<leader>u", vim.cmd.UndotreeToggle)

-- fugitive
map("n", "<leader>g", ":G<CR>")

-- copilot
map("n", "<leader>c", ":Copilot panel<CR>")

-- tmux
map("n", "<C-h>", ":TmuxNavigateLeft<CR>")
map("n", "<C-l>", ":TmuxNavigateRight<CR>")
map("n", "<C-j>", ":TmuxNavigateUp<CR>")
map("n", "<C-k>", ":TmuxNavigateDown<CR>")

---- vimspector
--map("n", "<leader>dd", ":call vimspector#Launch()<CR>")
--map("n", "<leader>dx", ":call vimspector#Reset()<CR>")
--map("n", "<leader>dc", ":call vimspector#Continue()<CR>")
--map("n", "<leader>k", ":call vimspector#StepOut()<CR>")
--map("n", "<leader>l", ":call vimspector#StepInto()<CR>")
--map("n", "<leader>j", ":call vimspector#StepOver()<CR>")
--map("n", "<leader>drc", ":call vimspector#RunToCursor()<CR>")
--map("n", "<leader>d?", function()
--	AddToWatch()
--end)
--map("n", "<leader>de", ":call vimspector#ToggleBreakpoint()<CR>")
