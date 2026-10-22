return {
	"https://github.com/squattingmonk/vim-nwscript",
	config = function ()
		vim.cmd([[ let g:nwscript#modules#enabled = ['fold'] ]])
	end
}
