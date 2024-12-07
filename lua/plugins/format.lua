return {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        local lint = require('lint')

        -- Configure linters for different filetypes
        lint.linters_by_ft = {
            python = { 'pylint', 'flake8' },
            javascript = { 'eslint' },
            typescript = { 'eslint' },
            lua = { 'luacheck' },
            go = { 'golangci-lint' },
            rust = { 'clippy' },
            -- Add more linters for other languages
        }

        -- Autocmd to trigger linting
        vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufReadPost', 'InsertLeave' }, {
            callback = function()
                -- Trigger linting for the current buffer
                require('lint').try_lint()
            end,
        })

        -- Optional: Customize linter configurations
        local pylint = lint.linters.pylint
        pylint.args = {
            '--disable=C0111',  -- Optional: disable docstring warnings
            '--output-format=text',
            '--score=yes',
            '--max-line-length=120'
        }

        -- Optional: Global linter configuration
        lint.linters.eslint.cmd = 'eslint_d'  -- Use eslint_d for faster linting
    end
}
