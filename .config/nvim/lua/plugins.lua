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
        "kdheepak/lazygit.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        config = function()
            vim.keymap.set("n", "<leader>lg", ":LazyGit<CR>", { noremap = true, silent = true })
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "pyright", "cssls", "clangd"}, -- 必要なLSPサーバーをリスト
            })
        end,
    },
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        version = false, -- Never set this value to "*"! Never!
        opts = {
            -- add any opts here
            -- for example
            provider = "openai",
            openai = {
                endpoint = "https://api.openai.com/v1",
                model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
                timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
                temperature = 0,
                max_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
                --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
            },
        },
        -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
        build = "make",
        -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            --- The below dependencies are optional,
            "echasnovski/mini.pick", -- for file_selector provider mini.pick
            "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
            "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
            "ibhagwan/fzf-lua", -- for file_selector provider fzf
            "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
            "zbirenbaum/copilot.lua", -- for providers='copilot'
            {
                -- support for image pasting
                "HakonHarnes/img-clip.nvim",
                event = "VeryLazy",
                opts = {
                    -- recommended settings
                    default = {
                        embed_image_as_base64 = false,
                        prompt_for_file_name = false,
                        drag_and_drop = {
                            insert_mode = true,
                        },
                        -- required for Windows users
                        use_absolute_path = true,
                    },
                },
            },
        },
        config = function ()
            require("avante").setup({
                -- system_prompt as function ensures LLM always has latest MCP server state
                -- This is evaluated for every message, even in existing chats
                system_prompt = function()
                local hub = require("mcphub").get_hub_instance()
                return hub:get_active_servers_prompt()
                end,
                -- Using function prevents requiring mcphub before it's loaded
                custom_tools = function()
                return {
                    require("mcphub.extensions.avante").mcp_tool(),
                }
                end,
                disabled_tools = {
                    "list_files",    -- Built-in file operations
                    "search_files",
                    "read_file",
                    "create_file",
                    "rename_file",
                    "delete_file",
                    "create_dir",
                    "rename_dir",
                    "delete_dir",
                    "bash",         -- Built-in terminal access
                },
            })
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
            local luasnip = require("luasnip")

            -- `custom_source` の正しい実装
            local custom_source = {}

            function custom_source.new()
                local self = setmetatable({}, { __index = custom_source })
                return self
            end

            function custom_source:complete(request, callback)
                local items = {
                    {
                        label = "lead",
                        insertText = [[
<!-- _class: lead -->]],
                        insertTextFormat = cmp.lsp.InsertTextFormat.Snippet,
                        kind = cmp.lsp.CompletionItemKind.Snippet
                    },
                    {
                        label = "contents",
                        insertText = [[
<!-- _class: contents -->
<div class=title>

## contents
</div>

<div class=content>

1. listed item
</div>]],
                        insertTextFormat = cmp.lsp.InsertTextFormat.Snippet,
                        kind = cmp.lsp.CompletionItemKind.Snippet
                    },
                    {
                        label = "witht",
                        insertText = [[
<!-- _class: witht -->

<div class=text>

</div>]],
                        insertTextFormat = cmp.lsp.InsertTextFormat.Snippet,
                        kind = cmp.lsp.CompletionItemKind.Snippet
                    },
                    {
                        label = "split32",
                        insertText = [[
<!-- _class: split32 -->

<div class=left>

</div>

<div class=right>

</div>]],
                        insertTextFormat = cmp.lsp.InsertTextFormat.Snippet,
                        kind = cmp.lsp.CompletionItemKind.Snippet
                    },
                }
                callback(items) -- ここが重要！
            end

            -- `cmp.register_source` の代わりに `cmp.new_source` を使う
            cmp.register_source("custom_source", custom_source.new())

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body) -- LuaSnipの使用
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Enterで補完決定
                    ["<Tab>"] = cmp.mapping.select_next_item(),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },   -- LSPの補完ソース
                    { name = "buffer" },     -- バッファ内の補完
                    { name = "path" },       -- ファイルパスの補完
                    { name = "luasnip" },    -- スニペットの補完
                    { name = "custom_source", priority = 1000 } -- カスタム補完ソース
                }),
            })
        end,
    },
    {
        "tanvirtin/monokai.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("monokai").setup({
                disable_background = true, -- disable background
            })
            vim.cmd.colorscheme("monokai")
            -- vim.api.nvim_set_hl(0, "Normal",      { bg = "NONE" })
            -- vim.api.nvim_set_hl(0, "NormalNC",    { bg = "NONE" })
            -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
            -- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
            -- vim.api.nvim_set_hl(0, "SignColumn",  { bg = "NONE" })
            -- vim.api.nvim_set_hl(0, "VertSplit",   { bg = "NONE" })
        end
    },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
        config = function()
            require("render-markdown").setup({
            heading = {
                border = true,
                width = 'block',
                left_pad = 2,
                right_pad = 4,
            },
            paragraph = {
                enabled = true,
                render_modes = false,
                left_margin = 0,
                min_width = 0,
            },
            code = {
                width = 'block',
                left_pad = 2,
                right_pad = 4,
            },
            dash = {
                enabled = true,
            },
            indent = {
                enabled = true
            },
        })
        end,
        opts = {
            file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
    },
    {
        "ravitemer/mcphub.nvim",
        dependencies = {
          "nvim-lua/plenary.nvim",  -- Required for Job and HTTP requests
        },
        -- comment the following line to ensure hub will be ready at the earliest
        cmd = "MCPHub",  -- lazy load by default
        build = "npm install -g mcp-hub@latest",  -- Installs required mcp-hub npm module
        -- uncomment this if you don't want mcp-hub to be available globally or can't use -g
        -- build = "bundled_build.lua",  -- Use this and set use_bundled_binary = true in opts  (see Advanced configuration)
        config = function()
            require("mcphub").setup({
                auto_approve = false,
            })
        end,
    }
})
