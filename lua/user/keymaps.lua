local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-\\>", "<C-w>v", opts)

--  Buffer Navigation
keymap("n", "<s-l>", ":bnext<cr>", opts)
keymap("n", "<s-h>", ":bprevious<cr>", opts)
keymap("n", "<leader>c", ":bd<cr>", opts)
--  Move lines
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", ":<Esc>:m .-2<CR>==gi<cr>", opts)
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

--  Tree Toggling
keymap("n", "<C-b>", ":NvimTreeToggle <CR>", {})       -- Toggles Tree
keymap("i", "<C-b>", "<ESC> :NvimTreeToggle <CR>", {}) -- Toggles Tree

--  Non Vim Keymapings
keymap("n", "<C-s>", ":w <CR>", opts)         --  Vainilla Save
keymap("i", "<C-s>", "<ESC> :w <CR> i", opts) -- Save (Insert Mode)
keymap("", "<C-c>", '"+y <CR>', {})           -- Copy to system clipboard
keymap('n', '<C-q>', ':q <CR>', {})           --Quit

--  Commenting (Requires Plugin)
keymap('n', '<C-_>', '<CMD>lua require("Comment.api").toggle.linewise.current()<CR>', {})
keymap('x', '<C-_>', '<ESC><CMD>lua require("Comment.api").locked("toggle.linewise")(vim.fn.visualmode())<CR>', {})

--  Formatting
keymap('n', "<s-a-f>", '<CMD>lua vim.lsp.buf.format()<CR>', opts)
keymap('v', "<s-a-f>", "<cmd>lua vim.lsp.buf.range_formatting()<CR><ESC>", {})

-- Telescope
keymap("", "<C-p>", ":Telescope find_files theme=dropdown previewer=false<CR>", {})
keymap("", "<C-f>", ":Telescope live_grep theme=dropdown<cr>", {})
keymap("", "<Space>b", ":Telescope buffers theme=dropdown previewer=false<CR>", {})
keymap("n", "<leader>b", ":Telescope buffers theme=dropdown previewer=false<CR>", {})
keymap("n", "<leader>d", ":Telescope diagnostics theme=dropdown <CR>", {})

--  ToggleTerm
keymap("", "<C-g>", "<cmd> lua _LAZYGIT_TOGGLE()<CR>", {})

--  Wrap Text
keymap("n", "<A-z>", ":set wrap!<cr>", opts)

--  Outline
keymap("n", "<A-o>", ":Outline <cr>", opts)

--  Terminal
keymap("n", "<s-a-t>", "<C-W>s:terminal<CR>i", {})


local function lsp_keymaps(bufnr)
  local keymaps_opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, "n", "GD", "<cmd>lua vim.lsp.buf.declaration()<CR>", keymaps_opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition() <CR>", keymaps_opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", keymaps_opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", keymaps_opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", keymaps_opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", keymaps_opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", keymaps_opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "GE", '<cmd>lua vim.diagnostic.goto_prev()<CR>', keymaps_opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", '<cmd>lua vim.diagnostic.open_float()<CR>', keymaps_opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "ge", '<cmd>lua vim.diagnostic.goto_next()<CR>', keymaps_opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", keymaps_opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP specific keymaps",
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    lsp_keymaps(bufnr)
    if client.name == "gopls" then
      require("user.handlers.keymaps.golsp").setup()
    end
  end,
})
