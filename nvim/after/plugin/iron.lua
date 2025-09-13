local iron = require("iron.core")
local common = require("iron.fts.common")
local ll = require("iron.lowlevel")

iron.setup {
    config = {
        -- Whether a repl should be discarded or not
        scratch_repl = true,
        -- Your repl definitions come here
        repl_definition = {
            sh = {
                command = { "zsh" }
            },
            python = {
                command = { "uv", "run", "ipython", "--no-autoindent" },
                format = function(lines, extras)
                    result = common.bracketed_paste_python(lines, extras)
                    filter = vim.tbl_filter(function(line) return not string.match(line, "^%s*#") end, result)
                    return filter
                end,
                block_dividers = { "# %%", "#%%" },
                env = { PYTHON_BASIC_REPL = "1" }
            }
        },
        -- set the file type of the newly created repl to ft
        -- bufnr is the buffer id of the REPL and ft is the filetype of the
        -- language being used for the REPL.
        repl_filetype = function(bufnr, ft)
            return ft
        end,
        dap_integration = true,
        repl_open_cmd = "vert botright split"
    },
    ignore_blank_lines = true,
}

local map = function(mode, key, fn)
    vim.keymap.set(mode, key, fn)
end

local function new_block_code()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    row = row

    local lines = {
        "",
        "",
        "# %%",
        ""
    }

    vim.api.nvim_buf_set_text(0, row, col, row, col, lines)
    vim.api.nvim_win_set_cursor(0, { row + 4, col + #lines })
end

local function new_block_comment()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    row = row

    local lines = {
        "",
        "",
        "# %% [markdown]",
        "#",
        "",
        "",
        "# %%",
        ""
    }

    vim.api.nvim_buf_set_text(0, row, col, row, col, lines)
    vim.api.nvim_win_set_cursor(0, { row + 4, col + #lines })
end

local function get_or_open_repl()
    local meta = vim.b[0].repl

    if not meta or not ll.repl_exists(meta) then
        ft = ft or ll.get_buffer_ft(0)
        meta = ll.get(ft)
    end

    if not ll.repl_exists(meta) then
        return
    end

    return meta
end

local function clear()
    iron.send(nil, string.char(12))
    meta = get_or_open_repl()
    if meta == nil then
        return
    end

    local sb = vim.bo[meta.bufnr].scrollback
    vim.bo[meta.bufnr].scrollback = 1
    vim.bo[meta.bufnr].scrollback = sb
end

map("n", ";t", function() vim.cmd("IronRepl") end)
map("n", ";R", function() vim.cmd("IronRestart") end)
map("n", ";r", function() iron.send_code_block(false) end)
map("n", ";n", function() iron.send_code_block(true) end)
map("n", ";c", new_block_code)
map("n", ";m", new_block_comment)
map("n", ";h", iron.send_until_cursor)
map("n", ";l", iron.send_line)
map("v", ";r", iron.visual_send)
map("n", ";k", clear)
