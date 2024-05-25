-- Code Completion
-- code-completion.lua
--[[
    <C-b> Scroll the docs down
    <C-f> Scroll the docs up
    <C-e> Abort the selection
    <CR>  Confirm the selection
    <TAB> Confirm the selection
]]
--

-- LSP
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {})
vim.keymap.set({ "n", "v" }, "<C-Space>", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>f", vim.diagnostic.open_float, {})
vim.keymap.set("n", "<leader>F", vim.diagnostic.setqflist, {})
vim.keymap.set("n", "<leader>sf", vim.diagnostic.show, {})
vim.keymap.set("n", "<leader>hf", vim.diagnostic.hide, {})
vim.keymap.set("n", "[f", vim.diagnostic.goto_prev, {})
vim.keymap.set("n", "]f", vim.diagnostic.goto_next, {})
vim.keymap.set("n", "ff", vim.lsp.buf.format, {})

if vim.lsp.inlay_hint then
    vim.keymap.set("n", "<leader>ih", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, {})
end

-- File Tree
vim.keymap.set("n", "<leader>b", ":Neotree filesystem reveal left<CR>", { silent = true })
vim.keymap.set("n", "<leader>B", ":Neotree close<CR>", { silent = true })

-- Fuzzy Finder
local telescope = {
    builtin = require("telescope.builtin"),
}

vim.keymap.set("n", "<leader>p", telescope.builtin.find_files, {})

---- Need to install "ripgrep" packet for it to work. E.g. `apt install ripgrep`.
vim.keymap.set("n", "<leader>g", telescope.builtin.live_grep, {})

-- Git
vim.keymap.set("n", "<leader>vh", ":Gitsigns preview_hunk<CR>", { silent = true })
vim.keymap.set("n", "<leader>vg", ":Git ", {})

-- DAP
local dap = require("dap")

vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, {})
vim.keymap.set("n", "<F5>", dap.continue, {})
vim.keymap.set("n", "<F10>", dap.step_over, {})
vim.keymap.set("n", "<F11>", dap.step_into, {})
vim.keymap.set("n", "<F12>", dap.step_out, {})
