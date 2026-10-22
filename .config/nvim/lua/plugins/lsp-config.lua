-- LSP Config
return {
    "neovim/nvim-lspconfig",
    config = function()
        local caps = require("cmp_nvim_lsp").default_capabilities()

        -- Define your custom nwscript server using the new framework
        vim.lsp.config.nwscript = {
            cmd = { "node", "C:\\Documents\\Games\\Neverwinter Nights\\Arelith\\Developer\\NWScript LSP\\nwscript-ee-language-server-main\\server\\out\\server.js", "--stdio"},
            filetypes = { "nwscript" },
            root_dir = "C:\\Documents\\Games\\Neverwinter Nights\\Arelith\\Developer\\AreDev1.1.5\\are-resources\\scripts",
        }

        local on_attach = function(client, bufnr)
            if vim.lsp.inlay_hint then
                vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
            end
        end

        local common_config = {
            capabilities = caps,
            on_attach = on_attach,
        }

        -- Setup standard servers
        local servers = {
            "clangd", "cssls", "dockerls", "docker_compose_language_service",
            "jsonls", "ts_ls", "lua_ls", "intelephense", "pylsp",
            "rust_analyzer", "yamlls", "html", "emmet_language_server"
        }

        for _, server in ipairs(servers) do
            vim.lsp.config[server] = vim.tbl_deep_extend("force", vim.lsp.config[server] or {}, common_config)
        end

        -- Setup nwscript with its specific settings
        vim.lsp.config.nwscript = vim.tbl_deep_extend("force", vim.lsp.config.nwscript, {
            capabilities = caps,
            on_attach = on_attach,
            settings = {
                ["nwscript-ee-lsp"] = {
                    autoCompleteFunctionsWithParams = false,
                    includeCommentsInFunctionsHover = true,
                    formatter = { enabled = false },
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
