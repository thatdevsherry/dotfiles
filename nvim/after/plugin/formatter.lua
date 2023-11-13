require('formatter').setup({
    logging = true,
    log_level = vim.log.levels.WARN,

    filetype = {
        python = {
            require('formatter.filetypes.python').black,
        },
    },

    -- Any filetype
    ['*'] = {
        require('formatter.filetypes.any').remove_trailing_whitespace
    }
})
