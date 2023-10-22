function ColorMyPencils(color)
    color = color or "gruvbox"
    vim.cmd.colorscheme(color)
end

function ToggleBackground()
    if (vim.o.background == "dark")
    then
        vim.o.background = "light"
    else
        vim.o.background = "dark"
    end
end

vim.keymap.set("n", "<leader>tc", ToggleBackground)

ColorMyPencils()
