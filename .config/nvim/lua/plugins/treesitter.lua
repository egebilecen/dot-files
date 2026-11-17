-- Syntax Highlighting
return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").setup({})

        -- Automatically install required parsers
        require("nvim-treesitter").install({ "python", "lua", "vim", "vimdoc" })

        -- Automatically start Tree-sitter parsing for all filetypes
        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                pcall(vim.treesitter.start)
            end,
        })
    end,
}
