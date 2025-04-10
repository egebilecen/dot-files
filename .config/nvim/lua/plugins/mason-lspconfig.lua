-- LSP Config
-- Install following python packages:
-- python3-pip
-- python3-venv
-- python3-neovim
-- python3-pynvim

return {
	"williamboman/mason-lspconfig.nvim",
	config = function()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"clangd",
				-- "csharp_ls",
				"cmake",
				"cssls",
				"dockerls",
				"docker_compose_language_service",
				"jsonls",
				"ts_ls",
				"lua_ls",
				"pylsp",
				"rust_analyzer",
				"yamlls",
				"html",
				"emmet_language_server",
			},
		})
	end,
}
