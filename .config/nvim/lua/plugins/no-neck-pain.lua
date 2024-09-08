return {
	"shortcuts/no-neck-pain.nvim",
	version = "*",
	config = function(_, opts)
		require("no-neck-pain").setup(opts)
	end,
}
