local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        'olivercederborg/poimandres.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('poimandres').setup {
                disable_background = true, -- disable background
           }
            vim.cmd("colorscheme poimandres")
        end,
    },
--    {
--        "iamcco/markdown-preview.nvim",
--        run = "cd app && yarn install", -- 必要な依存関係のインストール
--        ft = "markdown", -- Markdownファイルのときにのみ読み込む
--        config = function()
--            vim.g.mkdp_port = '8080' -- プレビュー用のポート番号
--            vim.g.mkdp_page_title = 'Markdown Preview' -- プレビューのページタイトル
--            vim.g.mkdp_browser = 'firefox' -- 使用するブラウザを指定
--        end,
--    },
    {
      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      build = "cd app && yarn install",
<<<<<<< HEAD
      config = function()
        vim.g.mkdp_filetypes = { "markdown" }
        vim.g.mkdp_auto_start = 1
        vim.g.mkdp_browser = ""
        vim.g.mkdp_open_ip = "127.0.0.1"
        vim.g.mkdp_open_to_the_world = 0
=======
      init = function()
        vim.g.mkdp_filetypes = { "markdown" }
>>>>>>> origin/main
      end,
      ft = { "markdown" },
    },
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup({
                padding = true, -- コメントとコードの間にスペースを追加
                sticky = true, -- コメントアウト後にカーソルの位置を保持
                ignore = '^$', -- 空行を無視
                toggler = {
                    -- 行コメント用のキー設定
                    line = 'gcc', -- `gcc` で現在行をコメント
                    block = 'gbc', -- `gbc` で選択ブロックをコメント
                },
                opleader = {
                    -- ビジュアルモードで選択範囲をコメント
                    line = 'gc', -- 選択範囲を行コメント
                    block = 'gb', -- 選択範囲をブロックコメント
                },
                extra = {
                    -- コメントに関連する追加の操作
                    above = 'gcO', -- 現在行の上にコメントを追加
                    below = 'gco', -- 現在行の下にコメントを追加
                    eol = 'gcA', -- 行末にコメントを追加
                },
            })
        end,
    },
    {
        'romgrk/barbar.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }, -- ファイルアイコンの表示用
            config = function()
                -- barbar の基本的な設定（例）
                vim.g.barbar_auto_setup = false  -- 自動セットアップを無効化（手動設定を行うため）
                require('barbar').setup({
                    animation = true, -- タブのスムーズなアニメーションを有効化
                    auto_hide = false, -- タブが一つしかない場合でも表示する
                    tabpages = true, -- タブページの表示
                    clickable = true, -- タブをクリック可能にする
                    icons = {
                        buffer_index = true, -- バッファ番号を表示
                        buffer_number = false, -- バッファ番号の代わりにファイル名
                        filetype = { enabled = true }, -- ファイルタイプのアイコンを表示
                        separator = { left = '▎', right = '' }, -- タブ間のセパレータ
                    },
                })
            end,
    },
    {
        "mrjones2014/smart-splits.nvim",
            config = function()
            require('smart-splits').setup({})
            vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
            vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
            vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
            vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
        end,
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup {
            }
        end,
    },
    {
        "shellRaining/hlchunk.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("hlchunk").setup({
                chunk = {
                    enable = true,
                    use_treesitter = true,
                    notify = false,
                },
                indent = {
                    enable = true,
                    chars = { "│" }, -- インデント表示のキャラクター
                },
                line_num = {
                    enable = false, -- 行番号のカスタマイズ表示（必要なら true に変更）
                },
                blank = {
                    enable = false, -- 空行の表示をハイライトする（必要なら true に変更）
                },
            })
        end,
    },
    {
        "nvim-tree/nvim-web-devicons",
        lazy = false,
        config = function()
            require('nvim-web-devicons').setup {
                default = true,
            }
        end,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("neo-tree").setup({
                close_if_last_window = true, -- 最後のウィンドウがneo-treeなら自動で閉じる
                filesystem = {
                    follow_current_file = {
                        enable = true, -- カーソルが移動したら自動で追跡
                    },
                },
                window = {
                    position = "float",
                    width = 25,
                },
            })
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup{}
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "pyright", "ttserver", "cssls"}, -- 必要なLSPサーバーをリスト
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local on_attach = function (client, bufnr)
            end
            lspconfig.lua_ls.setup {
                settings = {
                    Lua = {
                        diagnostics = {
                        globals = {"vim"},
                        },
                    },
                },
                on_attach = on_attach,
            }
            lspconfig.pyright.setup {on_attach = on_attach}
            lspconfig.clangd.setup {on_attach = on_attach}
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",  -- LSPの補完ソース
            "hrsh7th/cmp-buffer",    -- バッファ内の補完
            "hrsh7th/cmp-path",      -- パスの補完
            "L3MON4D3/LuaSnip",      -- スニペットエンジン
            "saadparwaiz1/cmp_luasnip", -- LuaSnipとの統合
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body) -- LuaSnipの使用
                    end,
                },
                mapping = {
                    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Enterで補完決定
                    ["<Tab>"] = cmp.mapping.select_next_item(),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                },
                sources = {
                    { name = "nvim_lsp" },   -- LSPの補完ソース
                    { name = "buffer" },     -- バッファ内の補完
                    { name = "path" },       -- ファイルパスの補完
                    { name = "luasnip" },    -- スニペットの補完
                },
            })
        end,
    },
--    {
--        -- コピペの設定
--        "ojroques/nvim-osc52",
--        config = function()
--            require('osc52').setup({
--                max_length = 0,        -- クリップボードにコピーする最大文字数 (0は制限なし)
--                silent = false,        -- 成功時の通知を有効化
--                trim = false,          -- 余計な空白を削除しない
--            })
--
--            -- 普通のヤンク動作でOSC52コピーを有効化
--            vim.keymap.set('n', '<leader>y', function()
--                require('osc52').copy_visual()
--            end, { desc = "Copy to clipboard using OSC52" })
--
--            vim.keymap.set('v', '<leader>y', function()
--                require('osc52').copy_visual()
--            end, { desc = "Copy to clipboard using OSC52" })
--        end,
--    },
})
