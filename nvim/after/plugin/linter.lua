local linter = require("lint")

linter.linters_by_ft = {
	python = { "mypy", "pylint" },
	markdown = { "markdownlint" },
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
	callback = function()
		linter.try_lint()
	end,
})
