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

return {
    {
        'GCBallesteros/vim-textobj-hydrogen',
        dependencies = { 'kana/vim-textobj-user' },
    },
    'GCBallesteros/jupytext.vim',
    --    {
    --        "Vigemus/iron.nvim",
    --        lazy = false,
    --    }
    {
        "pappasam/nvim-repl",
        opts = {
            filetype_commands = {
                javascript = { cmd = "deno repl", filetype = "javascript" },
                python = {
                    cmd =
                    "uv run ipython --TerminalInteractiveShell.editing_mode=emacs --quiet --nosep --no-autoindent -i -c \"%config InteractiveShell.ast_node_interactivity='last_expr_or_assign'\"",
                    repl_type = "ipython",
                    filetype = "python",
                },
            },
            default = { cmd = "bash", filetype = "bash" },
            open_window_default = "vertical botright split new",
        },
        keys = {
            { ";r", "<Plug>(ReplSendCell)",      mode = "n", desc = "ReplSendCell" },
            { ";l", "<Plug>(ReplSendLine)",      mode = "n", desc = "ReplSendLine" },
            { ";r", "<Plug>(ReplSendVisual)",    mode = "x", desc = "ReplSendVisual" },
            { ";t", "<cmd>Repl<cr>",             mode = "n", desc = "Open Repl" },
            { ";k", "<cmd>ReplClear<cr>",        mode = "n", desc = "Clear Relp" },
            { ";c", new_block_code,              mode = "n", desc = "Create new cell code below" },
            { ";m", new_block_comment,           mode = "n", desc = "Create new cell comment below" },
            { ";h", "Vgg<Plug>(ReplSendVisual)", mode = "n", desc = "Send until cursor" },
            { ";u", ensure_isopen,               mode = "n", desc = "Send until cursor" },

        },
    } }
