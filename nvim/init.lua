if vim.g.vscode then
	-- VSCode NeoVim
	require("rehan.vscode")
else
	require("rehan.core")
	require("rehan.lazy")
end
