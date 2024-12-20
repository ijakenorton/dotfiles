vim.g.mapleader = " "

local function tprint(tbl, indent)
	if not indent then
		indent = 0
	end
	for k, v in pairs(tbl) do
		local formatting = string.rep("  ", indent) .. k .. ": "
		if type(v) == "table" then
			print(formatting)
			tprint(v, indent + 1)
		elseif type(v) == "boolean" then
			print(formatting .. tostring(v))
		else
			print(formatting .. v)
		end
	end
end

local keymap = vim.keymap

vim.api.nvim_create_user_command(
	"Gp", -- string
	function()
		vim.cmd("Git push origin main")
	end,
	{
		nargs = 0,
		desc = "Git push origin main",
	}
)
--movement
keymap.set("n", "<c-d>", "<c-d>zz")
keymap.set("n", "<c-u>", "<c-u>zz")
-- keymap.set("x", "<leader>p", [["_dp]])
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", ",", "o<esc>")
keymap.set("n", "<leader>y", [["+y]])
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
-- keymap.set("n", "<leader>sc", function()
-- 	local command = ":let g:custom_command = "
-- 	if vim.g.custom_command == nil then
-- 		local new_command = (vim.fn.input("command > ", "'" .. vim.fn.expand("%"), "file_in_path"))
-- 		command = command .. new_command
-- 		vim.cmd(command)
-- 	else
-- 		local new_command = (vim.fn.input("command > ", "'" .. vim.g.custom_command, "file_in_path"))
-- 		command = command .. new_command
-- 		vim.cmd(command)
-- 	end
-- end)
keymap.set("n", "<M-m>", "@q")

keymap.set("n", "<leader><leader>", ":Make<CR>")
-- keymap.set("n", "<leader><leader>", function()
-- 	local command = {}
-- 	local current_command = "Current command: "
-- 	if vim.g.custom_command == nil then
-- 		vim.g.custom_command = vim.fn.expand("%")
-- 		command = { vim.g.custom_command }
-- 		current_command = current_command .. command[1]
-- 	else
-- 		for word in vim.g.custom_command:gmatch("%S+") do
-- 			if word == "%" then
-- 				word = vim.fn.expand("%")
-- 			end
-- 			table.insert(command, word)
-- 			current_command = current_command .. " " .. word
-- 		end
-- 	end
-- 	local append_data = function(_, data)
-- 		if data then
-- 			vim.api.nvim_buf_set_lines(0, -1, -1, false, data)
-- 		end
-- 	end
-- 	local buffer = vim.g.custom_buffer

-- 	if vim.g.custom_buffer == nil then
-- 		buffer = vim.api.nvim_create_buf(false, true)
-- 	end

-- 	vim.api.nvim_open_win(buffer, true, {
-- 		win = 0,
-- 		vertical = false,
-- 	})

-- 	vim.api.nvim_buf_set_lines(buffer, 0, -1, false, { current_command })
-- 	vim.fn.jobstart(command, { stdout_buffered = true, on_stdout = append_data, on_stderr = append_data })
-- end)

keymap.set("n", "gl", ":lua vim.diagnostic.open_float()<CR>", { silent = true })

-- Tab management
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open a new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close a tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- previous tab

-- Diff keymaps
keymap.set("n", "<leader>cc", ":diffput<CR>") -- put diff from current to other during diff
keymap.set("n", "<leader>cj", ":diffget 1<CR>") -- get diff from left (local) during merge
keymap.set("n", "<leader>ck", ":diffget 3<CR>") -- get diff from right (remote) during merge
keymap.set("n", "<leader>cn", "]c") -- next diff hunk
keymap.set("n", "<leader>cp", "[c") -- previous diff hunk

-- Quickfix keymaps
keymap.set("n", "<leader>qo", ":copen<CR>") -- open quickfix list
keymap.set("n", "<leader>qf", ":cfirst<CR>") -- jump to first quickfix list item
keymap.set("n", "<leader>qn", ":cnext<CR>") -- jump to next quickfix list item
keymap.set("n", "<leader>qp", ":cprev<CR>") -- jump to prev quickfix list item
keymap.set("n", "<leader>ql", ":clast<CR>") -- jump to last quickfix list item
keymap.set("n", "<leader>qc", ":cclose<CR>") -- close quickfix list
-- keymap.set("n", "<leader>q", vim.diagnostic.setqflist)

-- Vim-maximizer
keymap.set("n", "<leader>m", ":MaximizerToggle<CR>") -- toggle maximize tab

-- Nvim-tree
keymap.set("n", "<C-b>", ":Oil<cr>", { noremap = true, silent = true })
keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>") -- find file in file explorer

-- Telescope
keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, {})
keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, {})
keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, {})
keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, {})
keymap.set("n", "<leader>fs", require("telescope.builtin").current_buffer_fuzzy_find, {})
keymap.set("n", "<leader>fo", require("telescope.builtin").lsp_document_symbols, {})
keymap.set("n", "<leader>fi", require("telescope.builtin").lsp_incoming_calls, {})
keymap.set("n", "<leader>fm", function()
	require("telescope.builtin").treesitter({ default_text = ":method:" })
end)

-- Git-blame
keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>") -- toggle git blame

-- Harpoon
keymap.set("n", "<leader>ha", require("harpoon.mark").add_file)
keymap.set("n", "<leader>hh", require("harpoon.ui").toggle_quick_menu)
keymap.set("n", "<leader>hs", function()
	require("harpoon.ui").nav_file(1)
end)
keymap.set("n", "<leader>hd", function()
	require("harpoon.ui").nav_file(2)
end)
keymap.set("n", "<leader>hf", function()
	require("harpoon.ui").nav_file(3)
end)
keymap.set("n", "<leader>hj", function()
	require("harpoon.ui").nav_file(4)
end)
keymap.set("n", "<leader>hk", function()
	require("harpoon.ui").nav_file(5)
end)
keymap.set("n", "<leader>hl", function()
	require("harpoon.ui").nav_file(6)
end)
keymap.set("n", "<leader>h7", function()
	require("harpoon.ui").nav_file(7)
end)
keymap.set("n", "<leader>h8", function()
	require("harpoon.ui").nav_file(8)
end)
keymap.set("n", "<leader>h9", function()
	require("harpoon.ui").nav_file(9)
end)

-- -- LSP
keymap.set("n", "<leader>gg", "<cmd>lua vim.lsp.buf.hover()<CR>")
keymap.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
keymap.set("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
keymap.set("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
keymap.set("n", "<leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
keymap.set("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>")
keymap.set("n", "<leader>gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
keymap.set("n", "<leader>rr", "<cmd>lua vim.lsp.buf.rename()<CR>")
keymap.set("n", "<leader>gf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>")
keymap.set("n", "<leader>ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
keymap.set("n", "<leader>tr", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
keymap.set("i", "<C-Space>", "<cmd>lua vim.lsp.buf.completion()<CR>")

-- -- Debugging
keymap.set("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
keymap.set("n", "<leader>bc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>")
keymap.set("n", "<leader>bl", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>")
keymap.set("n", "<leader>br", "<cmd>lua require'dap'.clear_breakpoints()<cr>")
keymap.set("n", "<leader>ba", "<cmd>Telescope dap list_breakpoints<cr>")
keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>")
keymap.set("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>")
keymap.set("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>")
keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>")
keymap.set("n", "<leader>dd", function()
	require("dap").disconnect()
	require("dapui").close()
end)
keymap.set("n", "<leader>dt", function()
	require("dap").terminate()
	require("dapui").close()
end)
keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>")
keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>")
keymap.set("n", "<leader>di", function()
	require("dap.ui.widgets").hover()
end)
keymap.set("n", "<leader>d?", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.scopes)
end)
keymap.set("n", "<leader>df", "<cmd>Telescope dap frames<cr>")
keymap.set("n", "<leader>dh", "<cmd>Telescope dap commands<cr>")
keymap.set("n", "<leader>de", function()
	require("telescope.builtin").diagnostics({ default_text = ":E:" })
end)
