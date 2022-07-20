local keymap = vim.keymap.set

-- Telescope bindings
local function _find_files()
    local is_git = os.execute("git status &>/dev/null")
    if (is_git == 0) then
        vim.cmd(":Telescope git_files")
    else
        vim.cmd(":Telescope find_files")
    end
end

-- Setup leader key
vim.g.mapleader = ","

keymap('n', '<Leader>f', _find_files)
keymap('n', '<Leader>o', '<cmd> Telescope oldfiles <cr>')
keymap('n', '<Leader>s', '<cmd> Telescope live_grep <cr>')

-- Bufferline bindings
keymap('n', 'f',        '<cmd> BufferLinePick <cr>')
keymap('n', 'F',        '<cmd> BufferLinePickClose <cr>')
keymap('n', '<TAB>',    '<cmd> BufferLineCycleNext <cr>')
keymap('n', '<S-TAB>',  '<cmd> BufferLineCyclePrev <cr>')
keymap('n', 'm.',       '<cmd> BufferLineMoveNext <cr>')
keymap('n', 'm,',       '<cmd> BufferLineMovePrev <cr>')

-- Hope bindings
keymap('n', ';j', '<cmd> HopWord <cr>')
keymap('n', ';l', '<cmd> HopLineStart <cr>')

-- LSP Diagnostics Toggle bindings
keymap('n', '<Leader>dd', '<cmd> ToggleDiag <cr>')
keymap('n', '<leader>du', '<Plug>(toggle-lsp-diag-underline)')
keymap('n', '<leader>ds', '<Plug>(toggle-lsp-diag-signs)')
keymap('n', '<leader>dv', '<Plug>(toggle-lsp-diag-vtext)')
keymap('n', '<leader>di', '<Plug>(toggle-lsp-diag-update_in_insert)')

-- Binding for code runner
keymap('n', '<F5>', '<cmd> Run <cr>')

-- Other bindings nvimtree, markdown preview, Neoformat, Colorizer, LazyGit
keymap('n', '<leader>b',        '<cmd> NvimTreeToggle <cr>')
keymap('n', '<Leader>p',        '<cmd> Neoformat <cr>')
keymap('n', '<Leader>cc',       '<cmd> ColorizerToggle <cr>')
keymap('n', '<Leader>gg',       '<cmd> LazyGit <cr>')
keymap('n', '<Leader>n',        '<cmd> enew <cr>')
keymap('n', '<Leader><Space>',  '<cmd> noh <cr>')
keymap('n', '[[',               '<cmd> vertical resize +7 <cr>')
keymap('n', ']]',               '<cmd> vertical resize -7 <cr>')
keymap('n', '+',                '<cmd> resize +1 <cr>')
keymap('n', '-',                '<cmd> resize -1 <cr>')

-- LSP bindings
keymap('n', 'gD',        '<cmd> lua vim.lsp.buf.declaration() <cr>')
keymap('n', 'gd',        '<cmd> lua vim.lsp.buf.definition() <cr>')
keymap('n', 'K',         '<cmd> lua vim.lsp.buf.hover() <cr>')
keymap('n', 'gi',        '<cmd> lua vim.lsp.buf.implementation() <cr>')
keymap('n', '<space>wa', '<cmd> lua vim.lsp.buf.add_workspace_folder() <cr>')
keymap('n', '<space>wr', '<cmd> lua vim.lsp.buf.remove_workspace_folder() <cr>')
keymap('n', '<space>wl', '<cmd> lua print(vim.inspect(vim.lsp.buf.list_workspace_folders())) <cr>')
keymap('n', '<space>D',  '<cmd> lua vim.lsp.buf.type_definition() <cr>')
keymap('n', '<space>rn', '<cmd> lua vim.lsp.buf.rename() <cr>')
keymap('n', '<space>ca', '<cmd> lua vim.lsp.buf.code_action() <cr>')
keymap('n', 'gr',        '<cmd> lua vim.lsp.buf.references() <cr>')
keymap('n', '<space>e',  '<cmd> lua vim.diagnostic.open_float() <cr>')
keymap('n', '<space>q',  '<cmd> lua vim.diagnostic.setloclist() <cr>')
keymap('n', '<space>f',  '<cmd> lua vim.lsp.buf.formatting() <cr>')
keymap('n', '<C-k>',     '<cmd> lua vim.lsp.buf.signature_help() <cr>')
keymap('n', '<C-n>',     '<cmd> lua vim.diagnostic.goto_prev() <cr>')
keymap('n', '<C-p>',     '<cmd> lua vim.diagnostic.goto_next() <cr>')


-- Binding to swtich to normal mode in terminal, press <Esc> two times
vim.cmd(':tnoremap <Esc><Esc> <C-\\><C-n>')
