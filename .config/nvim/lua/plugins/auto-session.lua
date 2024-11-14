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
		bypass_save_filetypes = { "dashboard" },
		cwd_change_handling = true,
	},
	config = function(_, opts)
		require("auto-session").setup(opts)
		vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
	end,
}
