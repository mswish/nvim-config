local signs = { Error = "" , Warn = "!", Hint = "", Info = "כֿ" }

for type, icon in pairs(signs) do 
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local opts = { noremap=true, silent=true }
local on_attach = function(client, bufnr)
        vim.api.nvim_set_keymap('n', '<leader>h', '<cmd>lua vim.lsp.buf.hover()<CR>', opts) 
        vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        vim.api.nvim_set_keymap('n', '<leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
end
require'lspconfig'.pylsp.setup{ on_attach=on_attach }

require'lspconfig'.clangd.setup{ on_attach=on_attach }

require'lspconfig'.gopls.setup{ on_attach=on_attach }
