function NumberToggle()
    if vim.o.relativenumber == true then
        vim.o.relativenumber = false
    else
        vim.o.relativenumber = true
    end
end

