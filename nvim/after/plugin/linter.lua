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
local handle = io.popen("pyenv which pylint 2>/dev/null")
if handle then
	local output = handle:read("*a")
	local format = output:gsub("[\n\r]", "")
	handle:close()
	if format == "" then
		pylint.cmd = "pylint"
	else
		pylint.cmd = format
	end
else
	pylint.cmd = "pylint"
end
linter.linters_by_ft = {
	python = { "mypy", "pylint" },
	markdown = { "markdownlint" },
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
