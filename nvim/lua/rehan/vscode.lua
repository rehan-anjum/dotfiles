local keymap = vim.keymap
local opt = vim.opt
local g = vim.g

-- leader keys
g.mapleader = " "
g.maplocalleader = " "

-- line numbers
opt.number = true
opt.relativenumber = true

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- backspace behavior
opt.backspace = { "indent", "eol", "start" }

-- clipboard
opt.clipboard:append("unnamedplus")

-- window splitting
opt.splitright = true
opt.splitbelow = true

-- treat dash-separated words as single words
opt.iskeyword:append("-")

-- removes highlight after search
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { noremap = true, silent = true })

-- comments entire line
keymap.set("n", "gc", "gcc", { noremap = true, silent = true })

-- toggle VSCode terminal (works only in VSCode-Neovim)
keymap.set(
	"n",
	"<leader>t",
	"<Cmd>call VSCodeNotify('workbench.action.terminal.toggleTerminal')<CR>",
	{ silent = true }
)

keymap.set("n", "<leader>e", "<Cmd>call VSCodeNotify('workbench.action.explorer.viewExplorer')<CR>", { silent = true })
