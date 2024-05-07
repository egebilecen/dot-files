-- Color Scheme
return {
	"Mofiqul/vscode.nvim",
	priority = 1000,
	config = function()
		vim.o.background = "dark"

		require("vscode").setup({
			color_overrides = {},
		})

		vim.cmd.colorscheme("vscode")
	end,
}
