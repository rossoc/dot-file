return {
    {
        "OXY2DEV/markview.nvim",
        lazy = false,

    },
    {
        "rossoc/agentic.nvim",

        opts = {
            -- Available by default: "claude-acp" | "gemini-acp" | "codex-acp" | "opencode-acp" | "cursor-acp" | "auggie-acp"
            acp_providers = {
                ["gemini-acp"] = {
                    command = "/opt/homebrew/bin/qwen",
                },
            },
            provider = "gemini-acp", -- setting the name here is all you need to get started
            headers = {
                chat = function(parts)
                    return ""
                end
            },

            keymaps = {
                widget = {
                    close = "q", -- String for a single keybinding
                    change_mode = {
                        {
                            "<S-Tab>",
                            mode = { "i", "n", "v" }, -- Specify modes for this keybinding
                        },
                    },
                },
            },
        },

        -- these are just suggested keymaps; customize as desired
        keys = {
            {
                "'t",
                function() require("agentic").toggle() end,
                mode = { "n", "v", "i" },
                desc = "Toggle Agentic Chat"
            },
            {
                "'r",
                function() require("agentic").add_selection_or_file_to_context() end,
                mode = { "n", "v" },
                desc = "Add file or selection to Agentic to Context"
            },
            {
                "'a",
                function() require("agentic").new_session() end,
                mode = { "n", "v", "i" },
                desc = "New Agentic Session"
            },
            {
                "<C-c>",
                function() require("agentic").stop_generation() end,
                mode = { "n", "v", "i" },
                desc = "Stop current generation or tool execution"
            },
            -- {
            --     "'t",
            --     function() require("agentic").toggle_ui_mode() end,
            --     mode = { "n", "v", "i" },
            --     desc = "Toggle Agentic UI mode (sidebar/popup)"
            -- },
            {
                "'f",
                function()
                    local sessions = require("agentic.telescope.sessions")
                    sessions.sessions_picker()
                end,
                mode = { "n" },
                desc = "Agentic sessions picker"
            },
        },
    },
}
