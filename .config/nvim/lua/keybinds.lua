local telescope = {
    builtin = require("telescope.builtin")
}

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
vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, { desc = "LSP: Format code" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP: Hover" })
vim.keymap.set("n", "gd", telescope.builtin.lsp_definitions, { desc = "LSP: Go to definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "LSP: Go to declaration" })
vim.keymap.set("n", "gr", telescope.builtin.lsp_references, { desc = "LSP: References" })
vim.keymap.set("n", "<leader>lc", telescope.builtin.lsp_incoming_calls, { desc = "LSP: Incoming calls" })
vim.keymap.set("n", "<leader>ld", telescope.builtin.lsp_outgoing_calls, { desc = "LSP: Outgoing calls" })
vim.keymap.set("n", "<leader>li", telescope.builtin.lsp_implementations, { desc = "LSP: Implementations" })
vim.keymap.set("n", "<leader>ls", telescope.builtin.lsp_document_symbols, { desc = "LSP: Document symbols" })
vim.keymap.set("n", "<leader>lw", telescope.builtin.lsp_dynamic_workspace_symbols, { desc = "LSP: Workspace symbols" })
vim.keymap.set("n", "<leader>lD", telescope.builtin.diagnostics, { desc = "LSP: Diagnostics" })
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "LSP: Rename" })
vim.keymap.set("n", "<C-Space>", vim.lsp.buf.code_action, { desc = "LSP: Code action" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Code action" })
vim.keymap.set("n", "<leader>f", vim.diagnostic.open_float, { desc = "Diagnostic: Show float" })
vim.keymap.set("n", "<leader>F", vim.diagnostic.setqflist, { desc = "Diagnostic: Send to quickfix" })
vim.keymap.set("n", "<leader>sf", vim.diagnostic.show, { desc = "Diagnostic: Show" })
vim.keymap.set("n", "<leader>hf", vim.diagnostic.hide, { desc = "Diagnostic: Hide" })
vim.keymap.set("n", "[f", function() vim.diagnostic.jump({ count = -1, float = true }) end, { desc = "Diagnostic: Previous" })
vim.keymap.set("n", "]f", function() vim.diagnostic.jump({ count = 1, float = true }) end, { desc = "Diagnostic: Next" })

for _, lhs in ipairs({ "grn", "grr", "gra", "gri", "grt", "grx" }) do
    pcall(vim.keymap.del, "n", lhs)
end

vim.keymap.set("n", "<leader>o", function()
    local bufnr = vim.api.nvim_get_current_buf()
    local client = vim.lsp.get_clients({ bufnr = bufnr, name = "clangd" })[1]

    if not client then
        print("clangd: not attached to this buffer")
        return
    end

    local params = vim.lsp.util.make_text_document_params(bufnr)
    client:request("textDocument/switchSourceHeader", params, function(err, result)
        if err then
            print("clangd: " .. err.message)
        elseif not result then
            print("clangd: no matching source/header")
        else
            vim.cmd.edit(vim.fn.fnameescape(vim.uri_to_fname(result)))
        end
    end, bufnr)
end, { desc = "clangd: switch source/header" })

if vim.lsp.inlay_hint then
    vim.keymap.set("n", "<leader>ih", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, { desc = "LSP: Toggle inlay hints" })
end

-- File Tree
vim.keymap.set("n", "<leader>b", ":Texplore<CR>", { silent = true, desc = "File tree in new tab" })

-- Fuzzy Finder
local telescope = {
    builtin = require("telescope.builtin"),
}

vim.keymap.set("n", "<leader>p", telescope.builtin.find_files, { desc = "Find files" })

---- Need to install "ripgrep" packet for it to work. E.g. `apt install ripgrep`.
vim.keymap.set("n", "<leader>g", telescope.builtin.live_grep, { desc = "Live grep" })

-- Noice
vim.keymap.set("n", "<leader>nl", function ()
    require("noice").cmd("last")
end, { desc = "Noice: Last messages" })

vim.keymap.set("n", "<leader>nh", function ()
    require("noice").cmd("history")
end, { desc = "Noice: History" })

-- Git
vim.keymap.set("n", "<leader>vh", ":Gitsigns preview_hunk<CR>", { silent = true, desc = "Gitsigns: Preview hunk" })
vim.keymap.set("n", "<leader>vn", ":Gitsigns next_hunk<CR>", { silent = true, desc = "Gitsigns: Next hunk" })
vim.keymap.set("n", "<leader>vp", ":Gitsigns prev_hunk<CR>", { silent = true, desc = "Gitsigns: Previous hunk" })
vim.keymap.set("n", "<leader>vg", ":Git ", { desc = "Git" })
vim.keymap.set("n", "<leader>vd", ":Git difftool<CR>", { silent = true, desc = "Git: difftool" })

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

-- Custom
vim.keymap.set("n", "DD", '"_dd')
vim.keymap.set("n", "DW", '"_dw')
vim.keymap.set("n", "DB", '"_db')

vim.keymap.set("n", "<leader>|", "<C-w>v")
vim.keymap.set("n", "<leader>-", "<C-w>s")

vim.keymap.set("", "<ESC>", "<ESC>:noh<CR>:lua require('notify').dismiss()<CR>", { silent = true, desc = "Clear search highlight and notifications" })

-- CScope
local cscope_job = nil

-- Drives the lualine indicator (see lua/plugins/lualine.lua) that shows
-- while a cscope query is in flight.
local function set_cscope_searching(searching)
    vim.g.cscope_searching = searching
    pcall(function()
        require("lualine").refresh()
    end)
end

-- Cscope databases built elsewhere (e.g. the bedrock export) store paths
-- relative to the source tree root, which may not be the current cwd if
-- nvim was opened in a subdirectory. Walk up from cwd to find the ancestor
-- the path actually resolves against.
--
-- Only descendants of cwd (no ".." needed) are returned as a plain relative
-- path. Anything above cwd is returned absolute instead of "../"-prefixed:
-- plenary.nvim's Path:normalize() (used by Telescope's native select_tab /
-- select_vertical / select_horizontal actions) strips leading ".." segments
-- without actually walking up, which reopens the exact "wrong nested path"
-- bug this function exists to fix. Our own <CR> override bypasses that code
-- path, but the other Telescope selection keys don't, so "../" is unsafe
-- here even though it works for <CR>.
local function resolve_cscope_path(path)
    if vim.fn.filereadable(path) == 1 then
        return path
    end

    local cwd = vim.fn.getcwd()
    local dir = cwd
    while true do
        local candidate = dir .. "/" .. path
        if vim.fn.filereadable(candidate) == 1 then
            local prefix = cwd .. "/"
            if candidate:sub(1, #prefix) == prefix then
                return candidate:sub(#prefix + 1)
            end
            return candidate
        end

        local parent = vim.fn.fnamemodify(dir, ":h")
        if parent == dir then
            break
        end

        dir = parent
    end

    return path
end

local function cscope_picker(query_type, pattern)
    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local conf = require("telescope.config").values
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")

    if cscope_job and not cscope_job:is_closing() then
        print("Cscope: query already in progress, cancel with <leader>cx before starting another")
        return
    end

    local cmd = { "cscope", "-d", "-L", "-" .. query_type .. pattern }

    set_cscope_searching(true)

    cscope_job = vim.system(cmd, { text = true }, vim.schedule_wrap(function(obj)
        cscope_job = nil
        set_cscope_searching(false)

        if obj.signal and obj.signal ~= 0 then
            print("Cscope: query cancelled")
            return
        end

        if obj.code ~= 0 then
            print("Cscope: query failed: " .. (obj.stderr or ""))
            return
        end

        local lines = vim.split(obj.stdout or "", "\n")

        local results = {}
        for _, line in ipairs(lines) do
            local file, lnum, text = line:match("^(%S+)%s+%S+%s+(%d+)%s+(.*)$")
            if file then
                table.insert(results, {
                    filename = resolve_cscope_path(file),
                    lnum = tonumber(lnum),
                    text = text,
                    display = string.format("%s:%s: %s", file, lnum, text),
                })
            end
        end

        pickers.new({}, {
            prompt_title = "Cscope Results",
            finder = finders.new_table({
                results = results,
                entry_maker = function(entry)
                    return {
                        value = entry,
                        display = entry.display,
                        ordinal = entry.display,
                        filename = entry.filename,
                        lnum = entry.lnum,
                    }
                end,
            }),
            sorter = conf.generic_sorter({}),
            previewer = conf.grep_previewer({}),
            attach_mappings = function(prompt_bufnr, map)
                actions.select_default:replace(function()
                    local selection = action_state.get_selected_entry()
                    actions.close(prompt_bufnr)
                    vim.cmd("edit " .. vim.fn.fnameescape(selection.filename))
                    vim.api.nvim_win_set_cursor(0, { selection.lnum, 0 })
                end)
                return true
            end,
        }):find()
    end))
end

vim.api.nvim_create_user_command("Cs", function(opts)
   local query_type_map = {
        s = "0", -- find symbol
        g = "1", -- find global definition
        d = "2", -- find functions called by this function
        c = "3", -- find functions calling this function
        t = "4", -- find text string
        e = "6", -- find egrep pattern
        f = "7", -- find file
        i = "8", -- find files including this file
    }

    local args = vim.split(opts.args, " ")
    local qtype = query_type_map[args[1]]
    local pattern = table.concat(args, " ", 2)

    if not qtype then
        print("Unknown cscope query type: " .. args[1])
        return
    end

    cscope_picker(qtype, pattern)
end, { nargs = "+" })

-- Find symbol under cursor
vim.keymap.set("n", "<leader>cs", function()
    vim.cmd("Cs s " .. vim.fn.expand("<cword>"))
end, { desc = "Cscope: find symbol under cursor" })

-- Find global definition of word under cursor
vim.keymap.set("n", "<leader>cg", function()
    vim.cmd("Cs g " .. vim.fn.expand("<cword>"))
end, { desc = "Cscope: find global definition" })

-- Find functions called by this function
vim.keymap.set("n", "<leader>cd", function()
    vim.cmd("Cs d " .. vim.fn.expand("<cword>"))
end, { desc = "Cscope: find functions called by this function" })

-- Find functions calling this function
vim.keymap.set("n", "<leader>cc", function()
    vim.cmd("Cs c " .. vim.fn.expand("<cword>"))
end, { desc = "Cscope: find callers of function under cursor" })

-- Find text string (literal match, not symbol-aware)
vim.keymap.set("n", "<leader>ct", function()
    vim.cmd("Cs t " .. vim.fn.expand("<cword>"))
end, { desc = "Cscope: find text string under cursor" })

-- Find egrep pattern under cursor
vim.keymap.set("n", "<leader>ce", function()
    vim.cmd("Cs e " .. vim.fn.expand("<cword>"))
end, { desc = "Cscope: find egrep pattern under cursor" })

-- Find file (uses filename under cursor, e.g. when on a #include line)
vim.keymap.set("n", "<leader>cf", function()
    vim.cmd("Cs f " .. vim.fn.expand("<cfile>"))
end, { desc = "Cscope: find file" })

-- Find files that include the current file
vim.keymap.set("n", "<leader>ci", function()
    vim.cmd("Cs i " .. vim.fn.expand("%:t"))
end, { desc = "Cscope: find files including current file" })

-- Cancel a running cscope query
vim.keymap.set("n", "<leader>cx", function()
    if cscope_job and not cscope_job:is_closing() then
        cscope_job:kill(15)
    else
        print("Cscope: no active query")
    end
end, { desc = "Cscope: cancel running query" })

-- Symlink the bedrock cscope.out database into the current directory
vim.keymap.set("n", "<leader>cL", function()
    local target = "/x/eng/rlse/DOT/devN/cscope/bedrock/export/common/cscope/cscope.out"
    local link = vim.fn.getcwd() .. "/cscope.out"
    local result = vim.fn.system(string.format("ln -s %s %s", vim.fn.shellescape(target), vim.fn.shellescape(link)))

    if vim.v.shell_error ~= 0 then
        print("Cscope: failed to link cscope.out: " .. result)
    else
        print("Cscope: linked cscope.out -> " .. link)
    end
end, { desc = "Cscope: symlink bedrock cscope.out into cwd" })

