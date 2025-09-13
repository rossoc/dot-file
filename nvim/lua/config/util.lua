local function fname()
    return vim.fn.expand("%:p")
end

function Compile()
    local filetype = vim.bo.filetype
    local path = vim.fn.expand("%:p:h"):gsub(" ", "\\ ")
    local ext = vim.fn.expand("%:e")

    if ext == "uml" then
        filetype = "uml"
    end

    local commands = {
        rust = "!cd " .. path .. " && rustc ",
        cpp = "!make -f /Users/carlorosso/.config/Makefile compile arg=",
        c = "!make -f /Users/carlorosso/.config/Makefile compile arg=",
        tex = "!cd " .. path .. " && pdflatex -shell-escape ",
        go = "!cd " .. path .. " && go build ",
        typescript = "!cd " .. path .. " && tsc --downlevelIteration ",
        haskell = "!cd " .. path .. " && ghc ",
        typst = "!cd " .. path .. " && typst compile --root ../../../.. ",
        uml = "!cd " .. path .. " && plantuml ",
    }

    if commands[filetype] then
        vim.api.nvim_command(commands[filetype] .. fname():gsub(" ", "\\ "))
    else
        print("No compile command for filetype: " .. ext)
    end
end

function Run()
    local path = vim.fn.expand("%:p:h"):gsub(" ", "\\ ")
    local command_name = vim.fn.expand("%:r"):gsub(" ", "\\ ")
    local filename = vim.fn.expand("%:p"):gsub(" ", "\\ ")
    local filetype = vim.bo.filetype
    local base = "!echo '' && cd " .. path .. " && "

    local run_commands = {
        rust = "cargo run",
        cpp = base .. command_name,
        c = base .. command_name,
        go = base .. command_name,
        python = base .. " uv run " .. filename,
        javascript = base .. " node " .. filename,
        typescript = base .. " node " .. filename,
        lua = base .. " lua " .. filename,
        java = base .. " java " .. filename,
        haskell = base .. command_name,
        sh = base .. " bash " .. filename,
    }

    Compile()
    vim.cmd("sleep 100m")

    if run_commands[filetype] then
        vim.api.nvim_command(run_commands[filetype])
    else
        print("No run command defined for filetype: " .. filetype)
    end
end

function Test()
    local filetype = vim.bo.filetype
    local run_commands = {
        rust = "!cargo test",
        python = "!uv run pytest",
    }

    vim.api.nvim_command(run_commands[filetype])
end

function Map(mode, key, fn)
    vim.keymap.set(mode, key, fn)
end
