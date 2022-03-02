local ok, null_ls = pcall(require, "null-ls")

if not ok then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
    sources = {
        diagnostics.eslint.with {
            only_local = "node_modules/.bin",
        },

        formatting.stylua,
        formatting.eslint
    },

    on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
            vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
        end
    end,
}

