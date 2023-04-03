require("setup.keymap.fn")

local function map(mode, key, fn)
	vim.keymap.set(mode, key, fn)
end

-- harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

map("n", ";<tab>", function()
	ui.toggle_quick_menu()
end)
map("n", ";a", function()
	mark.add_file()
end)
map("n", ";r", function()
	mark.rm_file()
end)
map("n", ";q", function()
	ui.nav_file(1)
end)
map("n", ";w", function()
	ui.nav_file(2)
end)
map("n", ";e", function()
	ui.nav_file(3)
end)
map("n", ";r", function()
	ui.nav_file(3)
end)

-- telescope
local telescope = require("telescope.builtin")
map("n", "<leader>f", ":Telescope find_files<CR>")
map("n", ";f", ":Telescope live_grep<CR>")
map("n", ";g", ":Telescope git_files<CR>")
map("n", ";s", ":Telescope buffers<CR>")

-- useful vim remap
map("n", "<leader>w", ":Format<CR>:w<CR>")
map("n", "<leader>q", ":q!<CR>")
map("n", "<leader>e", ":Ex<CR>")
map("n", "<leader>v", ":vsplit<CR><C-w>w")
map("n", "<C-w>=", "<C-w>>")
map("n", "<C-w>-", "<C-w><")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "{", ":keepjumps {<CR>")
map("n", "}", ":keepjumps }<CR>")

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
map("n", "<leader>mC", ":! make clean<CR>")

-- cargo
map("n", ",b", ":! cargo build<CR>")
map("n", ",r", ":! cargo run<CR>")
map("n", ",t", ":! cargo test<CR>")

-- TroubleToggle
map("n", "<space>t", ":TroubleToggle document_diagnostics<CR>")
map("n", ";t", ":TroubleToggle workspace_diagnostics<CR>")

-- undo tree
map("n", "<leader>u", vim.cmd.UndotreeToggle)

-- fugitive
map("n", "<leader>g", ":Git<CR>")

-- copilot
map("n", "<leader>c", ":Copilot panel<CR>")
