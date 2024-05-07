-- DAP
local dap = require("dap")

vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, {})
vim.keymap.set("n", "<F5>", dap.continue, {})
vim.keymap.set("n", "<F10>", dap.step_over, {})
vim.keymap.set("n", "<F11>", dap.step_into, {})
vim.keymap.set("n", "<F12>", dap.step_out, {})

-- LSP
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, {})
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {})
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {})

-- File Tree
vim.keymap.set("n", "<leader>b", ":Neotree filesystem reveal left<CR>")
vim.keymap.set("n", "<leader>B", ":Neotree close<CR>")

-- Language Server
vim.keymap.set("n", "ff", vim.lsp.buf.format, {})

-- Fuzzy Finder
local telescope = {
	builtin = require("telescope.builtin"),
}

vim.keymap.set("n", "<leader>p", telescope.builtin.find_files, {})

---- Need to install "ripgrep" packet for it to work. E.g. `apt install ripgrep`.
vim.keymap.set("n", "<leader>g", telescope.builtin.live_grep, {})

-- Git Signs
vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", {})
vim.keymap.set("n", "<leader>gg", ":Git ", {})
