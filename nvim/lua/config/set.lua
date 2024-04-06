local opt = vim.opt
opt.guicursor = ""
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- set termguicolors to enable highlight groups
opt.termguicolors = true
vim.opt.nu = true
opt.relativenumber = true

--tabs
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true
opt.autoindent = true

opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

--search
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

opt.termguicolors = true

--backspace
opt.backspace = "indent,eol,start"

--split windows
opt.splitright = true
opt.splitbelow = true
opt.scrolloff = 0
opt.signcolumn = "yes"
opt.isfname:append("@-@")
opt.clipboard:append("unnamedplus")
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
opt.updatetime = 50
