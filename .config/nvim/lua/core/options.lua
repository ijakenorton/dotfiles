local opt = vim.opt

-- Session Management
opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Line Numbers
opt.relativenumber = true
opt.number = true
opt.textwidth = 100

-- Tabs & Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- Line Wrapping
opt.wrap = false

-- Search Settings
opt.ignorecase = true
opt.smartcase = true

-- Cursor Line
opt.cursorline = true

-- Appearance
opt.termguicolors = true
opt.background = "dark"
-- opt.signcolumn = "yes"

opt.hlsearch = false
opt.incsearch = true
-- opt.inccommand = true
opt.ignorecase = true
opt.smartcase = true

-- Backspace
opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")
opt.isfname:append("@-@")
opt.splitright = true
opt.splitbelow = true

opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.iskeyword:append("-")
