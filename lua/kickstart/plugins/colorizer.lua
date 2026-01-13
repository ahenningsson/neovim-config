return {
  'norcalli/nvim-colorizer.lua',
  event = 'VeryLazy',
  config = function()
    require('colorizer').setup({
      'css',
      'scss',
      'html',
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
      'lua',
    }, {
      css = true,
      mode = 'background',
    })
  end,
}
