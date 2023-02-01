-- configure language servers
local M = {
    -- easily configure language servers
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
        -- for autocompletition
        "hrsh7th/cmp-nvim-lsp",
        -- bridges gap b/w mason & lspconfig
        "williamboman/mason-lspconfig.nvim",
    },
    config = function(_, opts)
        local utils = require("new.utils")
        local mason_lspconfig = require("mason-lspconfig")
        local lspconfig = require("lspconfig")
        local lsp_utils = require("new.plugins.lsp.lsp-utils")

        lsp_utils.setup()

        mason_lspconfig.setup({
            ensure_installed = utils.lsp_servers,
        })

        mason_lspconfig.setup_handlers({
            function(server_name)
                lspconfig[server_name].setup({
                    on_attach = lsp_utils.on_attach,
                    capabilities = lsp_utils.capabilities,
                })
            end,

            ["pyright"] = function()
                lspconfig.pyright.setup({
                    on_attach = lsp_utils.on_attach,
                    capabilities = lsp_utils.capabilities,
                    settings = {
                        python = {
                            analysis = {
                                typeCheckingMode = "off",
                            },
                        },
                    },
                })
            end,
            ["clangd"] = function()
                local capabilities_cpp = lsp_utils.capabilities
                capabilities_cpp.offsetEncoding = { "uts-16" }
                lspconfig.clangd.setup({
                    on_attach = lsp_utils.on_attach,
                    capabilities = capabilities_cpp,
                })
            end,
        })
    end,
}

return M
