local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

--  remove space as leader key
-- keymap("","<Space>","<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

--  Window Navigation (requires plugin)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-\\>","<C-w>v",opts)

--  Buffer Navigation
keymap("n","<s-l>",":bnext<cr>",opts)
keymap("n","<s-h>",":bprevious<cr>",opts)
keymap("n","<leader>c",":bd<cr>",opts)
--  Move lines
keymap("n","<A-j>","<Esc>:m .+1<CR>==gi",opts)
keymap("n","<A-k>",":<Esc>:m .-2<CR>==gi<cr>",opts)
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

--  Tree Toggling
keymap("n","<C-b>",":NvimTreeToggle <CR>",{}) -- Toggles Tree
keymap("i","<C-b>","<ESC> :NvimTreeToggle <CR>",{}) -- Toggles Tree

--  Non Vim Keymapings
keymap("n","<C-s>",":w <CR>",opts) --  Vainilla Save
keymap("i","<C-s>","<ESC> :w <CR> i",opts) -- Save (Insert Mode)
keymap("","<C-c>",'"+y <CR>',{}) -- Copy to system clipboard
keymap('n','<C-q>', ':q <CR>', {}) --Quit

--  Commenting (Requires Plugin)
keymap('n', '<C-_>', '<CMD>lua require("Comment.api").toggle.linewise.current()<CR>',{})
keymap('x', '<C-_>', '<ESC><CMD>lua require("Comment.api").locked("toggle.linewise")(vim.fn.visualmode())<CR>',{})

--  Formatting
keymap('n',"<s-a-f>",'<CMD>lua vim.lsp.buf.formatting()<CR>',opts)
keymap('v',"<s-a-f>","<cmd>lua vim.lsp.buf.range_formatting()<CR><ESC>",{})

-- Telescope
keymap("","<C-p>",":Telescope find_files theme=dropdown previewer=false<CR>",{})
keymap("","<C-f>",":Telescope live_grep<cr>",{})
keymap("","<Space>b",":Telescope buffers theme=dropdown previewer=false<CR>",{})
keymap("n","<leader>b",":Telescope buffers previewer=false<CR>",{})

--  ToggleTerm
keymap("","<C-g>","<cmd> lua _LAZYGIT_TOGGLE()<CR>",{})

--  Wrap Text
keymap("n","<A-z>",":set wrap!<cr>",opts)

--  Outline
keymap("n","<A-o>",":SymbolsOutline <cr>",opts)

--  Terminal
keymap("n","<s-a-t>","<C-W>s:terminal<CR>i",{})
