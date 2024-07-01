-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

local keymaps = {
    n = {
        -- Better window navigation
        {'<S-h>', '<C-w>h', opts},
        {'<S-j>', '<C-w>j', opts},
        {'<S-k>', '<C-w>k', opts},
        {'<S-l>', '<C-w>l', opts},

        -- Resize with arrows
        {'<C-Up>', ':resize -2<CR>', opts},
        {'<C-Down>', ':resize +2<CR>', opts},
        {'<C-Left>', ':vertical resize -2<CR>', opts},
        {'<C-Right>', ':vertical resize +2<CR>', opts},

        -- Buffers
        -- Navigate buffers
        {'<C-h>', ':bprevious<CR>', opts},
        {'<C-l>', ':bnext<CR>', opts},
        {'<S-1>', ':BufferLineGoToBuffer 1<CR>', opts},
        {'<S-2>', ':BufferLineGoToBuffer 2<CR>', opts},
        {'<S-3>', ':BufferLineGoToBuffer 3<CR>', opts},
        {'<S-4>', ':BufferLineGoToBuffer 4<CR>', opts},
        {'<S-5>', ':BufferLineGoToBuffer 5<CR>', opts},
        {'<S-6>', ':BufferLineGoToBuffer 6<CR>', opts},
        {'<S-7>', ':BufferLineGoToBuffer 7<CR>', opts},
        {'<S-8>', ':BufferLineGoToBuffer 8<CR>', opts},
        {'<S-9>', ':BufferLineGoToBuffer 9<CR>', opts},
        -- Close buffers
        {'<C-w>', '<cmd>Bdelete!<CR>', opts},

        -- Clear highlights
        {'<leader>h', '<cmd>nohlseach<CR>', opts},

        -- Plugins --
        -- NvimTree
        {'<leader>e', ':NvimTreeToggle<CR>', opts},
        -- Neotree
        {'<leader>e', '<cmd>Neotree toggle<CR>', opts},

        -- Telescope
        {'<leader>ff', ':Telescope find', opts},
        {"<leader>ff", ":Telescope find_files<CR>", opts},
        {"<leader>ft", ":Telescope live_grep<CR>", opts},
        {"<leader>fp", ":Telescope projects<CR>", opts},
        {"<leader>fb", ":Telescope buffers<CR>", opts},

        -- Git
        {"<leader>lg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts},

        -- Comment
        {"<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts},

        -- DAP
        {"<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts},
        {"<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts},
        {"<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts},
        {"<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts},
        {"<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts},
        {"<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts},
        {"<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts},
        {"<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts},
        {"<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts},

        -- Lsp
        {"<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts},
        -- most common and fast save file
        {'<C-s>', ':update<cr>', opts},
    },
    i = {
        -- Press jk fast to enter
        {'jk', '<ESC>', opts},
        -- most common and fast save file
        {'<C-s>', '<esc>:update<cr>', opts},
    },
    v = {
        -- Better paste
        {'p', 'P', opts},

        -- Stay in indent mode
        {'<', '<gv', opts},
        {'>', '>gv', opts},
    },
    x = {
        {"<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts},
    },
    -- t = { },
    -- c = { },
}

for mode, kms in pairs(keymaps) do
  for index, value in pairs(kms) do
    keymap(mode, value[1], value[2], value[3])
  end
end
