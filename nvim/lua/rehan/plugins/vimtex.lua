-- return {
-- 	"lervag/vimtex",
-- 	lazy = false, -- we don't want to lazy load VimTeX
-- 	-- tag = "v2.15", -- uncomment to pin to a specific release
-- 	config = function()
-- 		-- VimTeX configuration goes here, e.g.
-- 		vim.g.vimtex_view_method = "zathura"
-- 	end,
-- }
return {
	"lervag/vimtex",
	lazy = false, -- keep eager
	config = function()
		-- Viewer
		vim.g.vimtex_view_method = "zathura"
		-- xdotool (used by the zathura viewer) doesn't work under Wayland
		if vim.env.WAYLAND_DISPLAY then
			vim.g.vimtex_view_method = "zathura_simple"
		end

		-- Compiler (latexmk, continuous)
		vim.g.vimtex_compiler_method = "latexmk"
		vim.g.vimtex_compiler_latexmk = {
			build_dir = "build",
			options = { "-pdf", "-interaction=nonstopmode", "-synctex=1" },
		}

		-- Auto-start compile when a TeX buffer initializes
		vim.api.nvim_create_autocmd("User", {
			pattern = "VimtexEventInitPost",
			callback = function()
				vim.cmd("VimtexCompile")
			end,
		})

		-- Optional: explicit keymaps (independent of VimTeX defaults)
		-- <leader>lt = compile (toggle/attach), <leader>lv = view (forward search)
		vim.keymap.set("n", "<leader>lt", "<cmd>VimtexCompile<CR>", { desc = "VimTeX: Compile (continuous)" })
		vim.keymap.set("n", "<leader>lv", "<cmd>VimtexView<CR>", { desc = "VimTeX: View PDF (Zathura)" })
	end,
}
