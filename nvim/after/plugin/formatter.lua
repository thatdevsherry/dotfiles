require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,

	filetype = {
		python = {
			require("formatter.filetypes.python").black,
		},
		javascript = {
			require("formatter.filetypes.javascript").eslint_d,
		},
		typescript = {
			require("formatter.filetypes.typescript").eslint_d,
		},
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
	},

	-- Any filetype
	["*"] = {
		require("formatter.filetypes.any").remove_trailing_whitespace,
	},
})
