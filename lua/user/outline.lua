-- vim.g.symbol_outline = {
--     position = 'right',
--     width = 15,
--     show_numbers = true,
-- }

local ok, outline = pcall(require, "symbols-outline");
if not ok then
    print('outline no cargo')
    return
end

outline.setup({
    position = 'right',
    width = 15,
    show_numbers = true,
})
