require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,

	filetype = {
		c = {
			require("formatter.filetypes.c").clangformat,
		},
		python = {
            -- Keep sorts before so formatter can work after sorting
			require("formatter.filetypes.python").isort,
			require("formatter.filetypes.python").black,
		},
		javascript = {
			require("formatter.filetypes.javascript").prettiereslint,
		},
		javascriptreact = {
			require("formatter.filetypes.javascriptreact").prettiereslint,
		},
		typescript = {
			require("formatter.filetypes.typescript").prettiereslint,
		},
		typescriptreact = {
			require("formatter.filetypes.typescriptreact").prettiereslint,
		},
		json = {
			require("formatter.filetypes.json").prettier,
		},
		html = {
			require("formatter.filetypes.html").prettier,
		},
		graphql = {
			require("formatter.filetypes.graphql").prettier,
		},
		rust = {
			require("formatter.filetypes.rust").rustfmt,
		},
		terraform = {
			require("formatter.filetypes.terraform").terraformfmt,
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
