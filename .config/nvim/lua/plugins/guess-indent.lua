return {
	opts = { filetype_exclude = { "c", "h" } },
	"nmac427/guess-indent.nvim",
	config = function(_, opts)
		require("guess-indent").setup(opts)
	end,
}
