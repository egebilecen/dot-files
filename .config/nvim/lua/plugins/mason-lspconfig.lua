-- LSP Config
return {
	"williamboman/mason-lspconfig.nvim",
	config = function()
		require("mason-lspconfig").setup({
			-- Install following python packages:
			-- python3-pip
			-- python3-venv
			-- python3-neovim
			-- python3-pynvim
			ensure_installed = {
				"clangd",
				-- "csharp_ls",
				"cmake",
				"cssls",
				"dockerls",
				"docker_compose_language_service",
				"jsonls",
				"tsserver",
				"lua_ls",
				"autotools_ls",
				"intelephense",
				"pylsp",
				"rust_analyzer",
				"yamlls",
			},
		})
	end,
}
