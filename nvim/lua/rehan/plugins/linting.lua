return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		-- Run pylint from the active virtualenv/conda env so it can resolve
		-- project imports; fall back to Mason's own venv when none is active.
		local mason_python = vim.fn.expand("$HOME/.local/share/nvim/mason/packages/pylint/venv/bin/python")

		local function pylint_python()
			local env = vim.env.VIRTUAL_ENV or vim.env.CONDA_PREFIX
			if env and env ~= "" then
				local python = env .. "/bin/python"
				local has_pylint = vim.fn.glob(env .. "/lib/python*/site-packages/pylint") ~= ""
				if vim.fn.executable(python) == 1 and has_pylint then
					return python
				end
			end
			return mason_python
		end

		lint.linters.pylint.cmd = pylint_python
		lint.linters.pylint.args = vim.list_extend(
			{ "-m", "pylint" },
			lint.linters.pylint.args
		)

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			svelte = { "eslint_d" },
			python = { "pylint" },
			kotlin = { "ktlint" },
			cpp = { "cppcheck" },
			c = { "clangtidy" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
