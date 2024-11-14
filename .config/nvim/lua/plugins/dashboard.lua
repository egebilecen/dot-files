-- Dashboard
return {
	"nvimdev/dashboard-nvim",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
		{ "MaximilianLloyd/ascii.nvim", dependencies = { "MunifTanjim/nui.nvim" } },
	},
	event = "VimEnter",
	config = function()
		local header_text = require("ascii").art.misc.hydra.hydra
		table.insert(header_text, "俺を倒せるのは俺だけだ。")
		table.insert(header_text, "")
		table.insert(header_text, "")

		require("dashboard").setup({
			config = {
				packages = { enable = false },
				header = header_text,
				shortcut = {
					{ desc = "󰊳 Update", group = "@string", action = "Lazy update", key = "u" },
					{ desc = " Mason", group = "@comment.todo", action = "Mason", key = "m" },
					{ desc = " Projects", group = "@module", action = "SessionSearch", key = "p" },
					{ desc = "󰈆 Exit", group = "@error", action = "qa", key = "q" },
				},
				project = { enable = false },
				mru = { enable = false },
				footer = function()
					local stats = require("lazy").stats()
					local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)

					return {
						"",
						"⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
					}
				end,
			},
		})

		vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#9cdcfe" })
		vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#808080" })
	end,
}
