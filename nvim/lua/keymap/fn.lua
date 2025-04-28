local function fname()
	return vim.fn.expand("%:p")
end

--! spostare quello che c'è nel makefile qui!

-- local CFLAGS = "-target arm64-apple-macos11 -mmacosx-version-min=11.0 -std=c++2a"
-- local CC = "g++"

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
	local path = vim.fn.expand("%:p:h"):gsub(" ", "\\ ")
	if ans == "rust" then
		ans = "!cd" .. path .. "& rustc "
	elseif ans == "cpp" or ans == "c" then
		ans = ":!make -f /Users/carlorosso/.config/Makefile compile arg="
	elseif ans == "tex" then
		ans = "!cd " .. path .. " && pdflatex -shell-escape "
	elseif ans == "go" then
		ans = "!cd " .. path .. " && go build "
	elseif ans == "python3" or ans =="python" then
        return
	elseif ans == "typescript" then
		ans = "!cd " .. path .. " && tsc --downlevelIteration "
	elseif ans == "haskell" then
		ans = "!cd " .. path .. " && ghc "
	elseif ans == "typst" then
		ans = "!cd " .. path .. " && typst compile --root ../../../.. "
	end
	vim.api.nvim_command(ans .. fname():gsub(" ", "\\ "))
end

function Make(opt)
    if vim.bo.filetype == "python" then
        vim.api.nvim_command("!echo '' && uv run " .. vim.fn.expand("%:r") .. ".py")
    end
end

--	Compile()
--	local ans
--	if vim.bo.filetype == "python" then
--        vim.api.nvim_command("!python3 " .. vim.fn.expand("%:r") .. ".py")
--        return
--	elseif vim.bo.filetype == "typescript" then
--		vim.api.nvim_command("!node " .. vim.fn.expand("%:r") .. ".js")
--		return
--	else
--		ans = ":!make -f /Users/carlorosso/.config/Makefile " .. opt .. " arg="
--	end
--	vim.api.nvim_command(ans .. fname())

--function AddToWatch()
--	local word = vim.api.expand("<cexpr>")
--	vim.api.nvim_command("call vimspector#AddWatch('" .. word .. "')")
--end
