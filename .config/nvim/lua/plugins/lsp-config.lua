-- LSP Config
return {
	"neovim/nvim-lspconfig",
	config = function()
		local caps = require("cmp_nvim_lsp").default_capabilities()
		local lspconfig = require("lspconfig")

		local on_attach = function(client, bufnr) end

		local common_config = {
			capabilities = caps,
			on_attach = on_attach,
		}

		lspconfig.clangd.setup(common_config)
		lspconfig.cssls.setup(common_config)
		lspconfig.dockerls.setup(common_config)
		lspconfig.docker_compose_language_service.setup(common_config)
		lspconfig.jsonls.setup(common_config)
		lspconfig.ts_ls.setup(common_config)
		lspconfig.lua_ls.setup(common_config)
		lspconfig.intelephense.setup(common_config)
		lspconfig.pylsp.setup(common_config)
		lspconfig.rust_analyzer.setup(common_config)
		lspconfig.yamlls.setup(common_config)
		lspconfig.html.setup(common_config)
		lspconfig.emmet_language_server.setup(common_config)
	end,
}
