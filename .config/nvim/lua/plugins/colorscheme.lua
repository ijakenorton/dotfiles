return {
	-- https://github.com/rebelot/kanagawa.nvim
	"rebelot/kanagawa.nvim", -- You can replace this with your favorite colorscheme
	lazy = false, -- We want the colorscheme to load immediately when starting Neovim
	priority = 1000, -- Load the colorscheme before other non-lazy-loaded plugins
	opts = {
		colors = {
			theme = {
				all = {
					ui = {
						bg_gutter = "none",
					},
				},
			},
		},
		transparent = true,
		background = {
			dark = "dragon", -- "wave, dragon"
		},
	},
	config = function(_, opts)
		require("kanagawa").setup(opts) -- Replace this with your favorite colorscheme
		vim.cmd("colorscheme kanagawa") -- Replace this with your favorite colorscheme
	end,
}
