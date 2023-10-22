-- Telescope
vim.keymap.set('n', '<leader>sf', require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set('n', "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set('n', "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set('n', "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set('n', "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })

-- Debug Adaptor Protocol
vim.keymap.set('n', '<leader>dc', require("dap").continue, { desc = "Continue" })
vim.keymap.set('n', '<leader>do', require("dap").step_over, { desc = "Step over" })
vim.keymap.set('n', '<leader>di', require("dap").step_into, { desc = "Step into" })
vim.keymap.set('n', '<leader>dO', require("dap").step_out, { desc = "Step out" })
vim.keymap.set('n', '<leader>b', require("dap").toggle_breakpoint, { desc = "Toggle breakpoint" })
vim.keymap.set('n', '<leader>B', require("dap").set_breakpoint, { desc = "Set breakpoint" })

-- Git
vim.keymap.set('n', '<C-p>', require("telescope.builtin").git_files, { desc = "Open git files in telescope" })

-- Fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Open fugitive git window" })

-- LSP
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end, { desc = "[F]ormat buffer using LSP" })

-- Misc
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Launch netrw" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection 1 line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection 1 line up" })
vim.keymap.set("n", "J", "mzJ`z", { desc = "Move line below current one to end of same" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll up with maintain cursor at center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll down with maintain cursor at center" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Go to next search result" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Go to previous search result" })
vim.keymap.set("n", "<leader>y", "\"+y", { desc = "Copy to system clipboard" })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "Copy to system clipboard" })
vim.keymap.set("n", "<leader>Y", "\"+Y", { desc = "Copy to system clipboard" })
vim.keymap.set("n", "<leader>d", "\"_d", {})
vim.keymap.set("v", "<leader>d", "\"_d", {})
vim.keymap.set("n", "Q", "<nop>", {})
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Go to next error" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Go to previous error" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Go to next error using location list" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Go to previous error using location list" })
