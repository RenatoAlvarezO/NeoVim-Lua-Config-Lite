local lualine = require "lualine"

local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
end

local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    sections = { "error", "warn" },
    symbols = { error = " ", warn = " " },
    colored = false,
    update_in_insert = false,
    always_visible = true,
}

local diff = {
    "diff",
    colored = true,
    symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
    cond = hide_in_width
}

local mode = {
    "mode",
    fmt = function(str)
        return "-- " .. str .. " --"
    end,
}

local filetype = {
    "filetype",
    icons_enabled = true,
    separator = { left = '', right = '' }
    -- icon = nil,
}

local branch = {
    "branch",
    icons_enabled = true,
    icon = "",
    separator = { left = '' }
}

local location = {
    "location",
    padding = 2,
    separator = { left = '' }
}

local buffers = {
    "buffers",
}

local filename = {
    "filename"
}

-- cool function for progress
local progress = function()
    local current_line = vim.fn.line(".")
    local total_lines = vim.fn.line("$")
    return math.ceil((current_line / total_lines) * 100) .. " %%"
end

local spaces = function()
    return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

-- Tabline config
local getFilePath = function()
    local currentPath = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.")
    return (currentPath)
end

lualine.setup({
    options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "    ", right = "   " },
        section_separators = { left = '', right = '' },
        disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
        always_divide_middle = true,
    },
    sections = {
        lualine_a = { branch, diagnostics },
        lualine_b = { mode },
        lualine_c = { getFilePath },
        -- lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_x = { diff, spaces, "encoding" },
        lualine_y = { filetype, location },
        lualine_z = { { progress, separator = { right = '', left = '' } } },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {
        -- lualine_b = { buffers },
        -- lualine_a = { getFilePath }
        -- lualine_b = {  },
        -- lualine_a = {  }
    },
    extensions = {},
})
