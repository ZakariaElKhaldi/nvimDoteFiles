-- In your init.lua
local function set_transparent_background()
    -- Protect the function from errors
    pcall(function()
        vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "NonText", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE", ctermbg = "NONE" })
    end)
end

-- Create an autocmd group to manage transparency
local transparency_group = vim.api.nvim_create_augroup("TransparencySettings", { clear = true })

-- Apply transparency after colorscheme is loaded
vim.api.nvim_create_autocmd("ColorScheme", {
    group = transparency_group,
    pattern = "*",
    callback = set_transparent_background
})

-- Also set transparency on initial load
set_transparent_background()

-- Optional: Transparency toggle
_G.toggle_transparency = function()
    local current_bg = vim.api.nvim_get_hl_by_name('Normal', true).background
    if current_bg then
        set_transparent_background()
    else
        vim.cmd('hi Normal guibg=default ctermbg=default')
    end
end

-- Optional: Map to a key (e.g., <leader>t)
vim.api.nvim_set_keymap('n', '<leader>t', ':lua toggle_transparency()<CR>', { noremap = true, silent = true })
