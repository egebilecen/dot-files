-- LSP Config
return {
	"neovim/nvim-lspconfig",
	config = function()
		local caps = require("cmp_nvim_lsp").default_capabilities()
		local lspconfig = require("lspconfig")
		local configs = require("lspconfig.configs")

		if not configs.nwscript then
			configs.nwscript = {
				default_config = {
					cmd = { "node", "C:\\Documents\\Games\\Neverwinter Nights\\Arelith\\Developer\\NWScript LSP\\nwscript-ee-language-server-main\\server\\out\\server.js", "--stdio"},
					filetypes = { "nwscript" },
					root_dir = "C:\\Documents\\Games\\Neverwinter Nights\\Arelith\\Developer\\AreDev1.1.5\\are-resources\\scripts",
				}
			}
		end

		local on_attach = function(client, bufnr)
			if vim.lsp.inlay_hint then
				vim.lsp.inlay_hint.enable(true)
			end
		end

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
		lspconfig.nwscript.setup({
			settings = {
				["nwscript-ee-lsp"] = {
					autoCompleteFunctionsWithParams = false,
					includeCommentsInFunctionsHover = true,
					formatter = {
						enabled = false,
					},
					compiler = {
						enabled = true,
						verbose = true,
						nwnHome = [[ "C:\Users\egebi\OneDrive\Belgeler\Neverwinter Nights" ]],
						nwnInstallation = [[ "C:\Program Files (x86)\Steam\steamapps\common\Neverwinter Nights" ]]
					},
				},
			}
		})
	end,
}
