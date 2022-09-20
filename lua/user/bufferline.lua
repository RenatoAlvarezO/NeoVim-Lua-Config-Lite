local bufferline = require("bufferline")

bufferline.setup(
    {
        options = {
            -- indicator = { style = "underline" },
            diagnostics = "nvim_lsp",
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    text_align = "center",
                    separator = true
                }
            },
            separator_style = "padded_slant"
        }
    }
)
