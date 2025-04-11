-- 行番号の表示
vim.opt.number = true

-- signcolumnを常に表示
vim.opt.signcolumn = "yes"

-- タブ幅の設定
vim.opt.tabstop = 4
vim.opt.expandtab = true

-- ファイルを読み込むとき，タブの幅をスペース4つ分にする
vim.opt.shiftwidth = 4

-- 改行のとき自動でインデント
vim.opt.smartindent = true

-- カーソルのある行の色を変える
vim.opt.cursorline = true

-- 検索している文字に色をつける
vim.opt.hlsearch = true

-- ヤンクでクリップボードにコピー
vim.opt.clipboard:append({ 'unnamed', 'unnamedplus' })

-- jjでinsertからnormalへ
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', { noremap = true, silent = true })

-- カーソルのある行は絶対行で，ほかは相対行
vim.opt.number = true
vim.opt.relativenumber = true
-- init.lua
-- vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { noremap = true, silent = true })

vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
