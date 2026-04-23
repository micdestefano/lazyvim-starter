return {
    {
        "folke/tokyonight.nvim",
        opts = {
            style = "night",
            transparent = true,
            styles = {
                sidebars = "transparent",
                floats = "normal",
            },
            -- Default colors and highlights are defined into the colors and highlights
            -- tables into the following file:
            -- ~/.local/share/nvim/lazy/tokyonight.nvim/extras/lua/tokyonight_night.lua
            -- We have to modify those fields for making changes. The fields correspond
            -- to standard VIM names (see :help highlight-groups)
            on_colors = function(colors)
                -- colors.mds_comment = "#98A3B8"
                colors.mds_comment = "#dfe5ec"
                colors.mds_visible_gray = "#B0BECF"
            end,
            on_highlights = function(highlights, colors)
                -- Look at :help highlight-groups for the right variables
                highlights.NonText = { fg = colors.mds_comment }
                highlights.EndOfBuffer = { fg = colors.mds_comment }
                highlights.WinSeparator = { fg = colors.mds_comment, bold = true }
                highlights.NvimTreeWinSeparator = {
                    bg = colors.mds_comment,
                    fg = colors.mds_comment,
                }
                highlights.Comment = { fg = colors.mds_comment, italic = true }
                highlights.LineNrAbove = { fg = colors.mds_visible_gray }
                highlights.LineNrBelow = { fg = colors.mds_visible_gray }
                highlights.DiagnosticUnderlineWarn = { fg = colors.mds_visible_gray }
                highlights.DiagnosticUnnecessary = { fg = colors.mds_visible_gray }
            end,
        },
    },
}
