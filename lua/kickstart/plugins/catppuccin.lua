return {
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000,
        opts = {
            flavour = 'mocha',
            transparent_background = false,
            dim_inactive = {
                enabled = true,
                shade = 'dark',
                percentage = 0.15,
            },
            integrations = {
                telescope = { enabled = true },
                treesitter = true,
            },
            custom_highlights = function(colors)
                return {
                    -- Cleaner line numbers
                    LineNr = { bg = colors.none },
                    -- Transparent floats
                    NormalFloat = { bg = colors.none },
                    FloatBorder = { bg = colors.none, fg = colors.blue },
                }
            end,
        },
        config = function(_, opts)
            require('catppuccin').setup(opts)
            vim.cmd.colorscheme 'catppuccin'
        end,
    },
}
