-- Be sure to install "stylua" through `:Mason`!
require("vim-config")

-- Package Manager
---- Lazy NeoVim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)
-- End Package Manager

local function replace_termcodes(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function KEYS(str)
	vim.api.nvim_feedkeys(replace_termcodes(str), "m", true)
end

require("lazy").setup("plugins")
require("keybinds")
