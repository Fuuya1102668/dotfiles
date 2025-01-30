vim.g.mapleader = " "        -- リーダーキーをスペースに

-- タブ（バッファ）を前後に移動する
vim.keymap.set('n', '<A-,>', '<Cmd>BufferPrevious<CR>', { noremap = true, silent = true }) -- 前のバッファへ移動
vim.keymap.set('n', '<A-.>', '<Cmd>BufferNext<CR>', { noremap = true, silent = true })     -- 次のバッファへ移動

-- 特定のバッファにジャンプ（1〜9番目のバッファにジャンプ）
vim.keymap.set('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', { noremap = true, silent = true })

-- 最後のバッファへジャンプ
vim.keymap.set('n', '<A-0>', '<Cmd>BufferLast<CR>', { noremap = true, silent = true })

-- バッファを閉じる
vim.keymap.set('n', '<A-c>', '<Cmd>BufferClose<CR>', { noremap = true, silent = true })

-- バッファを並び替え
vim.keymap.set('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', { noremap = true, silent = true }) -- 左に移動
vim.keymap.set('n', '<A->>', '<Cmd>BufferMoveNext<CR>', { noremap = true, silent = true })     -- 右に移動

-- ヤンクでクリップボードにコピー
vim.opt.clipboard:append({ 'unnamed', 'unnamedplus' })

-- Terminalモードで1回目の 'j' を通常通り 'j' として処理し，2回目の 'j' でTerminalモードを抜ける
vim.keymap.set('t', 'j', '<Plug>j')
vim.keymap.set('t', '<Plug>jj', '<C-\\><C-n>')

vim.keymap.set("n", "<leader>f", ":Neotree toggle<CR>")

