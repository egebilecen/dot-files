-- Telescope Extension
-- Sets Vim's select use Telescope's picker.
return {
	"nvim-telescope/telescope-ui-select.nvim",
	config = function()
		require("telescope").setup({
			extensions = {
				require("telescope.themes").get_dropdown({}),
			},
		})

		require("telescope").load_extension("ui-select")
	end,
}
