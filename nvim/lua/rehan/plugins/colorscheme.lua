return {
	"bluz71/vim-nightfly-colors",
	branch = "legacy",
	name = "nightfly",
	priority = 1000,
	config = function()
		-- Set custom colors
		vim.g.nightflyColors = {
			bg = "#161616",
			violet = "#ff74b8",
		}

		-- Apply the colorscheme
		vim.cmd("colorscheme nightfly")
	end,
}
