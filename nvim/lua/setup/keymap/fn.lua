local function fname()
	return vim.fn.expand("%:p")
end

--! spostare quello che c'è nel makefile qui!

local CFLAGS = "-target arm64-apple-macos11 -mmacosx-version-min=11.0 -std=c++2a"
local CC = "g++"

--function Compile2()
--	local filetype = vim.bo.filetype
--	local filepath = vim.fn.expand("%:p:h")
--	local cmd = "!cd " .. filepath .. " && ""
--
--	if filetype == "rust" then
--		cmd = cmd .. "rustc "
--	elseif ans == "cpp" or ans == "c" then
--		cmd == cmd .. CC .. " " .. CFLAGS .. " " ..
--end

function Compile()
	local ans = vim.bo.filetype
	if ans == "rust" then
		ans = "!cd" .. vim.fn.expand("%:p:h") .. "& rustc "
	elseif ans == "cpp" or ans == "c" then
		ans = ":!make -f /Users/carlorosso/.config/Makefile compile arg="
	elseif ans == "tex" then
		ans = "!cd " .. vim.fn.expand("%:p:h") .. " && pdflatex "
	elseif ans == "go" then
		ans = "!cd " .. vim.fn.expand("%:p:h") .. " && go build "
	elseif ans == "python" then
		ans = "!cd " .. vim.fn.expand("%:p:h") .. " && python "
	elseif ans == "typescript" then
		ans = "!cd " .. vim.fn.expand("%:p:h") .. " && tsc --downlevelIteration "
	end
	vim.api.nvim_command(ans .. fname())
end

function Make(opt)
	Compile()
	local ans
	if vim.bo.filetype == "python" then
		ans = "!python3 "
	elseif vim.bo.filetype == "typescript" then
		vim.api.nvim_command("!node " .. vim.fn.expand("%:r") .. ".js")
		return
	else
		ans = ":!make -f /Users/carlorosso/.config/Makefile " .. opt .. " arg="
	end
	vim.api.nvim_command(ans .. fname())
end

--function AddToWatch()
--	local word = vim.api.expand("<cexpr>")
--	vim.api.nvim_command("call vimspector#AddWatch('" .. word .. "')")
--end
