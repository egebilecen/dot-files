vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set relativenumber")

vim.cmd("nmap <A-d> $")
vim.cmd("vmap <A-d> $")
vim.cmd("nmap <A-a> ^")
vim.cmd("vmap <A-a> ^")

vim.cmd("imap <A-d> <End>")
vim.cmd("imap <A-a> <Home>")

vim.cmd("nmap <A-j> 10<C-e>")
vim.cmd("nmap <A-k> 10<C-y>")
vim.cmd("nmap <A-q> <C-o>")
vim.cmd("nmap <A-e> <C-i>")

vim.cmd('nmap DD "_dd')
vim.cmd('nmap DW "_dw')
vim.cmd('nmap DB "_db')

-- vim.cmd("nmap <C-h> <C-w>h")
-- vim.cmd("nmap <C-j> <C-w>j")
-- vim.cmd("nmap <C-k> <C-w>k")
-- vim.cmd("nmap <C-l> <C-w>l")

vim.cmd("nmap <silent> <A-.> <Cmd>BufferPrevious<CR>")
vim.cmd("nmap <silent> <A-,> <Cmd>BufferNext<CR>")
vim.cmd("nmap <silent> <A-x> <Cmd>BufferClose<CR>")
vim.cmd("nmap <silent> <A-X> <Cmd>BufferRestore<CR>")
vim.cmd("nmap <silent> <A-p> <Cmd>BufferPin<CR>")

-- Need to install "xclip" package.
vim.cmd("set clipboard+=unnamedplus")

-- Globals
vim.g.mapleader = " "
vim.g.better_escape_shortcut = "jj"
