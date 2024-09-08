-- すべてのLSPで診断をすぐに行う設定
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        vim.lsp.buf.document_highlight()  -- ファイルを開いたときに診断を実行
    end,
})

-- init.lua
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        -- Neovim 起動時に neo-tree を自動で開く
        require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
    end,
})

require("keymaps")
require("options")
require("plugins")
