-- Syntax Highlighting
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local treesitter = {
			config = require("nvim-treesitter.configs"),
			parser = require("nvim-treesitter.parsers")
		}
        
        local parser_config = treesitter.parser.get_parser_configs()
		parser_config.nwscript = {
			install_info = {
				url = "https://github.com/tinygiant98/tree-sitter-nwscript",
				files = { "src/parser.c" },
				generate_requires_npm = false,
				requires_generate_from_grammar = false,
			},
			filestype = "nwscript",
		}

		treesitter.config.setup({
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = false },
		})
	end,
}
