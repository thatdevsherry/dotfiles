local linter = require("lint")
local mypy = linter.linters.mypy
local pylint = linter.linters.pylint

mypy.args = {
	-- Use virtualenv mypy and not mason one
	"--python-executable",
	"python",
	-- END
	"--show-column-numbers",
	"--show-error-end",
	"--hide-error-codes",
	"--hide-error-context",
	"--no-color-output",
	"--no-error-summary",
	"--no-pretty",
}
pylint.cmd = "pylint"

linter.linters_by_ft = {
	python = { "pylint", "mypy" },
	markdown = { "markdownlint" },
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
