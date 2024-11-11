return {
	"rmagatti/auto-session",
	opts = {
		session_lens = {
			mappings = {
				delete_sesion = nil,
				alternate_session = nil,
				copy_session = nil,
			},
		},
		suppressed_dirs = { "~/", "~/Projects", "~/Downloads" },
	},
	config = function(_, opts)
		require("auto-session").setup(opts)
		vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
	end,
}
