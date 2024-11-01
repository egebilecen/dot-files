-- Code Completion:
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
vim.keymap.set("n", "<C-Space>", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
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
local dapui = require("dapui")

vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, {})
vim.keymap.set("n", "<leader>dc", dap.run_to_cursor, {})
vim.keymap.set("n", "<leader>dq", function()
	KEYS("<leader>B")
	dapui.close()
	KEYS("<leader>b")
	KEYS("<A-l>")
end, {})
vim.keymap.set("n", "<leader>?", function()
	dapui.eval(nil, { enter = true })
end, {})
vim.keymap.set("n", "<F5>", dap.continue, {})
vim.keymap.set("n", "<F10>", dap.step_over, {})
vim.keymap.set("n", "<F11>", dap.step_into, {})
vim.keymap.set("n", "<F12>", dap.step_out, {})

-- File Tabs
vim.keymap.set("n", "<A-h>", ":BufferPrevious<CR>", { silent = true })
vim.keymap.set("n", "<A-l>", ":BufferNext<CR>", { silent = true })
vim.keymap.set("n", "<A-x>", ":BufferClose<CR>", { silent = true })
vim.keymap.set("n", "<A-X>", ":BufferRestore<CR>", { silent = true })
vim.keymap.set("n", "<A-p>", ":BufferPin<CR>", { silent = true })
vim.keymap.set("n", "<A-1>", ":BufferGoto 1<CR>", { silent = true })
vim.keymap.set("n", "<A-2>", ":BufferGoto 2<CR>", { silent = true })
vim.keymap.set("n", "<A-3>", ":BufferGoto 3<CR>", { silent = true })
vim.keymap.set("n", "<A-4>", ":BufferGoto 4<CR>", { silent = true })
vim.keymap.set("n", "<A-5>", ":BufferGoto 5<CR>", { silent = true })
vim.keymap.set("n", "<A-6>", ":BufferGoto 6<CR>", { silent = true })
vim.keymap.set("n", "<A-7>", ":BufferGoto 7<CR>", { silent = true })
vim.keymap.set("n", "<A-8>", ":BufferGoto 8<CR>", { silent = true })
vim.keymap.set("n", "<A-9>", ":BufferGoto 9<CR>", { silent = true })
vim.keymap.set("n", "<A-0>", ":BufferLast<CR>", { silent = true })

-- Custom
vim.keymap.set({ "n", "v" }, "<A-d>", "$")
vim.keymap.set({ "n", "v" }, "<A-a>", "^")
vim.keymap.set("i", "<A-d>", "<esc>$a")
vim.keymap.set("i", "<A-a>", "<esc>^i")

vim.keymap.set("n", "<A-j>", "10<C-e>")
vim.keymap.set("n", "<A-k>", "10<C-y>")
vim.keymap.set("n", "<C-k>", "<C-b>")
vim.keymap.set("n", "<C-j>", "<C-f>")

vim.keymap.set("n", "<A-q>", "<C-o>")
vim.keymap.set("n", "<A-e>", "<C-i>")

vim.keymap.set("n", "DD", '"_dd')
vim.keymap.set("n", "DW", '"_dw')
vim.keymap.set("n", "DB", '"_db')

vim.keymap.set("n", "<leader>|", "<C-w>v")
vim.keymap.set("n", "<leader>-", "<C-w>s")

vim.keymap.set("n", "<leader>n", ":noh<CR>", { silent = true })
