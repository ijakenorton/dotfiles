
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    callback = function()
        vim.keymap.set('t', '<Esc>', '<C-\\><C-n>',
            { noremap = true, silent = true, buffer = vim.api.nvim_get_current_buf() })
    end
})

vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "quickfix",
    callback = function()
        vim.cmd('nnoremap <CR> <CR>')
    end
})
