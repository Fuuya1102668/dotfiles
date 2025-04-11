-- すべてのLSPで診断をすぐに行う設定
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        vim.lsp.buf.document_highlight()  -- ファイルを開いたときに診断を実行
    end,
})


require("keymaps")
require("options")
require("plugins")
