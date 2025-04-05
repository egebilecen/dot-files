-- vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set relativenumber")
vim.cmd("set cursorline")
vim.cmd("set linebreak")

-- vim.cmd("nmap <C-h> <C-w>h")
-- vim.cmd("nmap <C-j> <C-w>j")
-- vim.cmd("nmap <C-k> <C-w>k")
-- vim.cmd("nmap <C-l> <C-w>l")

-- Need to install "xclip" package.
vim.cmd("set clipboard+=unnamedplus")

-- Globals
vim.g.mapleader = " "
vim.g.better_escape_shortcut = "jj"

-- Other
vim.opt.termguicolors = true

vim.api.nvim_set_var("do_filetype_lua", 1)
vim.filetype.add({
	extension = {
		nss = "nwscript",
	},
	pattern = {
		[".*%.nss$"] = "nwscript",
	},
})