local lsp = require("lsp-zero")
local lspconfig = require("lspconfig")
local cmp = require("cmp")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-Space>"] = cmp.mapping.complete(),
	["<CR>"] = cmp.mapping.confirm({ select = true }),
})

-- Override LSP keymaps
lsp.on_attach(function(_, bufnr)
	local opts = { buffer = bufnr, remap = false }
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.lsp.buf.goto_next()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.lsp.buf.goto_prev()
	end, opts)
	vim.keymap.set("n", "<leader>vca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>vrr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "<leader>vrn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
end)

lsp.set_preferences({
	suggest_lsp_servers = true,
	setup_servers_on_start = true,
	set_lsp_keymaps = true,
	configure_diagnostics = true,
	cmp_capabilities = true,
	manage_nvim_cmp = true,
	call_servers = "local",
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I",
	},
})

require("mason-tool-installer").setup({
	ensure_installed = {
		"mypy",
		"pylint",
		"markdownlint",
		"pydocstyle",
		"eslint",
		"black",
		"prettier",
		"stylua",
		"isort",
	},
})
mason.setup({})
mason_lspconfig.setup({
	ensure_installed = {
		"angularls",
		"awk_ls",
		"bashls",
		"clangd",
		"dockerls",
		"docker_compose_language_service",
		"eslint",
		"graphql",
		"html",
		"jsonls",
		"lua_ls",
		"spectral",
		"tailwindcss",
		"terraformls",
		"tsserver",
		"pyright",
		"rust_analyzer",
		"vale_ls",
		"yamlls",
	},
	handlers = {
		lsp.default_setup,
		lua_ls = function()
			local lua_opts = lsp.nvim_lua_ls()
			lspconfig.lua_ls.setup(lua_opts)
		end,
		pyright = function()
			local pyright_opts = function()
				local handle = io.popen("pyenv which python3 2>/dev/null")
				if handle then
					local output = handle:read("*a")
					local format = output:gsub("[\n\r]", "")
					handle:close()
					if format == "" then
						return {}
					else
						return {
							settings = {
								python = {
									pythonPath = format,
								},
							},
						}
					end
				else
					return {}
				end
			end
			local opts = pyright_opts()
			lspconfig.pyright.setup(opts)
		end,
		pylyzer = lsp.noop, -- not stable
	},
})

cmp.setup({
	mapping = cmp_mappings,
})

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	update_in_insert = false,
	underline = true,
	severity_sort = false,
	float = true,
})
