return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    branch = 'main', -- Changed from 'master' to 'main'
    config = function()
        -- Optional: Configure install directory if needed
        -- require('nvim-treesitter').setup {
        --   install_dir = vim.fn.stdpath('data') .. '/site'
        -- }

        -- Install parsers for the languages you want
        local parsers = {
            'bash',
            'c',
            'go',
            'diff',
            'html',
            'lua',
            'luadoc',
            'markdown',
            'markdown_inline',
            'query',
            'vim',
            'vimdoc',
            'sql',
            'typescript',
            'javascript',
            'tsx',
            'css', -- CSS syntax
            'scss', -- SCSS syntax
            'json', -- JSON files
            'jsonc', -- JSON with comments (tsconfig.json)
        }

        -- Install parsers asynchronously
        require('nvim-treesitter').install(parsers)

        -- Enable treesitter highlighting for all filetypes
        vim.api.nvim_create_autocmd('FileType', {
            pattern = '*',
            callback = function()
                -- Enable treesitter if a parser is available
                local ok = pcall(vim.treesitter.start)
                if not ok then
                    -- Silently fail if no parser is available
                    return
                end
            end,
            desc = 'Enable treesitter highlighting',
        })

        -- Enable treesitter-based indentation (optional, can be disabled per filetype)
        vim.api.nvim_create_autocmd('FileType', {
            pattern = {
                'bash',
                'c',
                'go',
                'html',
                'lua',
                'markdown',
                'typescript',
                'javascript',
                'tsx',
                'css', -- ADD
                'scss', -- ADD
                'json', -- ADD
            },
            callback = function()
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
            desc = 'Enable treesitter indentation',
        })
    end,
}
