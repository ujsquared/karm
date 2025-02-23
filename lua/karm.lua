local augroup = vim.api.nvim_create_augroup("karm", { clear = true })

Todo_exist_global = false
Todo_buffer_global = nil
local function toggle_todo()
    if Todo_exist_global then
        vim.api.nvim_win_close(Todo_buffer_global, true)
        Todo_exist_global = false
        return
    end
    Todo_buffer_global = vim.api.nvim_open_win(0, false, {
        split='right',
        width=40,
        win= 0
    })
    vim.api.nvim_tabpage_set_win(0,Todo_buffer_global)
    vim.cmd('e ~/todo.md')
    Todo_exist_global = true
end

local function main()
    local curr_window = vim.api.nvim_get_current_win()
    toggle_todo()
    vim.api.nvim_tabpage_set_win(0,curr_window)
end

local function setup()
    vim.api.nvim_create_autocmd("VimEnter", {
        group = augroup,
        desc = "Send a basic hello world! message on load", once = true,
        callback = main
    })
end

return { setup = setup, toggle_todo = toggle_todo}
