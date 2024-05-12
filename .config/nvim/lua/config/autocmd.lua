
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    callback = function()
        vim.keymap.set('t', '<Esc>', '<C-\\><C-n>',
            { noremap = true, silent = true, buffer = vim.api.nvim_get_current_buf() })
    end
})
-- Create an autocommand using Lua that applies specific settings for C files
vim.api.nvim_create_autocmd("FileType", {
    pattern = "c",  -- This triggers the autocommand for C files
    callback = function(args)
        -- Apply settings specifically to the buffer identified by args.buf
        local bufnr = args.buf
        vim.api.nvim_buf_set_option(bufnr, 'shiftwidth', 2)
        vim.api.nvim_buf_set_option(bufnr, 'softtabstop', 2)
        vim.api.nvim_buf_set_option(bufnr, 'expandtab', true)
    end
})

vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "quickfix",
    callback = function()
        vim.cmd('nnoremap <CR> <CR>')
    end
})
