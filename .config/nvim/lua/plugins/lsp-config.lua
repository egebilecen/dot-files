-- LSP Config
return {
	"neovim/nvim-lspconfig",
	config = function()
		local caps = require("cmp_nvim_lsp").default_capabilities()
		local lspconfig = require("lspconfig")

		lspconfig.clangd.setup({
			capabilities = caps,
		})
		lspconfig.cssls.setup({
			capabilities = caps,
		})
		lspconfig.dockerls.setup({
			capabilities = caps,
		})
		lspconfig.docker_compose_language_service.setup({
			capabilities = caps,
		})
		lspconfig.jsonls.setup({
			capabilities = caps,
		})
		lspconfig.tsserver.setup({
			capabilities = caps,
		})
		lspconfig.lua_ls.setup({
			capabilities = caps,
		})
		lspconfig.autotools_ls.setup({
			capabilities = caps,
		})
		lspconfig.intelephense.setup({
			capabilities = caps,
		})
		lspconfig.pylsp.setup({
			capabilities = caps,
		})
		lspconfig.rust_analyzer.setup({
			capabilities = caps,
		})
		lspconfig.yamlls.setup({
			capabilities = caps,
		})
	end,
}
