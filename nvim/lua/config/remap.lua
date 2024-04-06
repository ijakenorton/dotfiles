vim.g.mapleader = " "

-- -- vim.keymap.set("n", "<leader>pv", vim.cmd.Vex)
vim.keymap.set('n', '<leader>es', ':EslintFixAll<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>pac', ':PackerSync<CR>')
vim.keymap.set('n', '<leader>t', ':belowright10 split | terminal<cr>')
--vim.keymap.set("n", "<leader>pv", vim.cmd.lexplore)
vim.keymap.set("i", "<tab>", "")
vim.keymap.set("n", "<leader>n", "o<ESC>")

--surround
-- vim.api.nvim_set_keymap('x', '"', ':s/\\%V\\(.*\\)\\%V/"\\1"/g<CR>', {noremap = true, silent = true})
--window keymaps
vim.keymap.set("n", "<leader>sv", "<C-w>v")
vim.keymap.set("n", "<leader>sh", "<C-w>s")
vim.keymap.set("n", "<leader>se", "<C-w>=")
vim.keymap.set("n", "<leader>sx", ":close<CR>")

--tab keymaps
vim.keymap.set("n", "<leader>to", ":tabnew<CR>")
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>")
vim.keymap.set("n", "<leader>tn", ":tabn<CR>")
vim.keymap.set("n", "<leader>tp", ":tabp<CR>")

vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")

-- vim.api.nvim_exec('unmap <c-j>', false)
vim.api.nvim_set_keymap('i', '<tab>', '<tab>', { noremap = true, silent = true })
vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "n", "nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dp]])
-- next greatest remap ever : asbjornhaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>y", [["+y]])

-- vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
-- this is going to get me cancelled
vim.keymap.set("i", "<c-j>", "<down>")
vim.keymap.set("i", "<c-k>", "<up>")
vim.keymap.set("i", "<c-h>", "<left>")
vim.keymap.set("i", "<c-l>", "<right>")
vim.keymap.set("n", "q", "<nop>")
-- vim.keymap.set("n", "<c-f>", "<cmd>silent !tmux neww tmux-sessionizer<cr>")
vim.keymap.set("n", "<leader>fo", vim.lsp.buf.format)
vim.keymap.set("n", "x", '"_x"')
vim.keymap.set("n", "<leader>q", vim.diagnostic.setqflist)
vim.keymap.set("n", "gl", ":lua vim.diagnostic.open_float()<cr>")
-- vim.keymap.set("n", "<c-k>", "<cmd>cnext<cr>zz")
-- vim.keymap.set("n", "<c-j>", "<cmd>cprev<cr>zz")
vim.keymap.set("n", "<leader>k", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>cprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

vim.keymap.set("n", "<leader>m", ":MaximizerToggle<CR>")

--telescope



