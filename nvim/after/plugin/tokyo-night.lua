require("tokyonight").setup({
    -- your configuration comes here
    -- or leave it empty to use the default settings
    style = "storm",        -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
    transparent = false,    -- Enable this to disable setting the background color
    terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
    styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = false },
        keywords = { italic = false },
        functions = { bold = true },
        variables = { bold = true },
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "dark",            -- style for sidebars, see below
        floats = "normal",            -- style for floating windows
    },
    sidebars = { "qf", "help" },      -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
    day_brightness = 0.3,             -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
    hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
    dim_inactive = true,              -- dims inactive windows
    lualine_bold = false,             -- When `true`, section headers in the lualine theme will be bold

    on_highlights = function(hl, c)
        local bg = "#363a57"
        local border = "#aaafcb"
        local highlight_bg = "#292c42"
        local highlight_fg = "#ff862a"


        hl.TelescopeNormal = {
            bg = bg,
            fg = c.fg_dark,
        }
        hl.TelescopeBorder = {
            bg = bg,
            fg = border,
        }
        hl.TelescopePromptNormal = {
            bg = bg,
        }
        hl.TelescopePromptBorder = {
            bg = bg,
            fg = border,
        }
        hl.TelescopePromptTitle = {
            bg = bg,
            fg = border,
        }
        hl.TelescopePreviewTitle = {
            bg = bg,
            fg = border,
        }
        hl.TelescopeResultsTitle = {
            bg = bg,
            fg = border,
        }
        hl.TelescopePreviewLine = {
            bg = highlight_bg,
            fg = highlight_fg,
        }

        hl.LineNr = {
            fg = "#ff862a"
        }
    end,
})

vim.cmd [[colorscheme tokyonight]]
