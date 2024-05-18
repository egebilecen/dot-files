-- Syntax Highlighting
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local treesitter = {
			config = require("nvim-treesitter.configs"),
		}

		treesitter.config.setup({
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = false },
		})
	end,
}
