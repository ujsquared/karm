local augroup = vim.api.nvim_create_augroup("karm", { clear = true })

local function main()
    local new_window = vim.api.nvim_open_win(0, false, {
        split='right',
        width=70,
        win= 0
    })
    vim.api.nvim_tabpage_set_win(0,new_window)
    vim.cmd('e ~/todo.md')
end

local function setup()
    vim.api.nvim_create_autocmd("VimEnter", {
        group = augroup,
        desc = "Send a basic hello world! message on load", once = true,
        callback = main
    })
end

return { setup = setup }
