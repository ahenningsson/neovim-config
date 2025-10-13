return {
  'rebelot/kanagawa.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    compile = true, -- cache theme for faster startup
    undercurl = true,
    transparent = false, -- solid background
    dimInactive = true, -- darker inactive windows
    theme = 'wave', -- choose your flavor: "wave", "dragon", "lotus"
    colors = {
      theme = {
        all = {
          ui = {
            bg_gutter = 'none', -- removes line number background
          },
        },
      },
    },
    overrides = function(colors)
      return {
        NormalFloat = { bg = 'none' },
        FloatBorder = { bg = 'none', fg = colors.theme.ui.fg },
      }
    end,
  },
  config = function(_, opts)
    require('kanagawa').setup(opts)
    vim.cmd 'colorscheme kanagawa'
  end,
}
