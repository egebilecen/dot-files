-- Fuzzy Finder
return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("telescope").setup({
            pickers = {
                find_files = {
                    -- Arguments: https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md
                    find_command = { "rg", "--no-ignore", "--files", "--hidden", "-g", "!.git" },
                },
            },
        })
    end,
}
