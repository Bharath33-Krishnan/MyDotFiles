
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

vim.opt.relativenumber = true
vim.api.nvim_create_autocmd("BufEnter", {
    -- command = "setlocal tabstop=4 softtabstop=4 shiftwidth=4 smartindent expandtab"
    command = "setlocal tabstop=4 softtabstop=4 shiftwidth=4 smartindent"
})
vim.keymap.set('n','<ESC>','<CMD>noh<CR>')
vim.keymap.set('n','<space><shift><TAB>','<space>bj')
vim.keymap.set('n','<space><TAB>','<CMD>BufferLineCycleNext<CR>')
vim.keymap.set('n','<C-p>','<CMD>CompetiTest run<CR>')

lvim.colorscheme = "gruvbox"

vim.api.nvim_exec([[
  augroup SetLuaFileType
    autocmd!
    autocmd BufRead,BufNewFile *.script set filetype=lua
  augroup END
]], false)



lvim.plugins = {
    { 'codota/tabnine-nvim', build = "./dl_binaries.sh" },
    {"morhetz/gruvbox"},
    {"norcalli/nvim-colorizer.lua"},
    {
        "xero/miasma.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd("colorscheme miasma")
        end,

    },
    {
        "stevearc/dressing.nvim",
        config = function()
            require("dressing").setup({
                input = { enabled = false },
            })
        end,
    },
    {
        "nvim-neorg/neorg",
        ft = "norg", -- lazy-load on filetype
        config = true, -- run require("neorg").setup()
    },
    {
        'xeluxee/competitest.nvim',
        dependencies = 'MunifTanjim/nui.nvim',
        config = function() require('competitest').setup() end,
    },
    {
        "nyoom-engineering/oxocarbon.nvim"
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
}
require('tabnine').setup({
  mode = "insert",
  disable_auto_comment=true,
  accept_keymap="<C-]>",
  dismiss_keymap = "<C-[>",
  debounce_ms = 800,
  suggestion_color = {gui = "#808080", cterm = 244},
  exclude_filetypes = {"TelescopePrompt", "NvimTree"},
  log_file_path = nil, -- absolute path to Tabnine log file
})
require('colorizer').setup()
require('competitest').setup() -- to use default configuration
