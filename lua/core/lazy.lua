-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup mapleader
local k = vim.keycode
vim.g.mapleader=k'<Space>'
vim.keymap.set('n', '<leader>E', '<cmd>:Ex<cr>')

-- options.lua
vim.o.mousehide=true;
vim.o.smarttab=true;
vim.o.wrap=false;
vim.o.rnu=true;
vim.o.nu=true;
vim.o.sw=4;

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins

    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {"nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate"},
    { "mason-org/mason.nvim", opts = {} },
    { "neovim/nvim-lspconfig" },
    { 'nvim-telescope/telescope.nvim', tag = '0.1.8', dependencies = { 'nvim-lua/plenary.nvim' } },
    { 'ThePrimeagen/harpoon' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/nvim-cmp' },
    { "L3MON4D3/LuaSnip", version = "v2.4", dependencies = { "rafamadriz/friendly-snippets" }, },
    { 'saadparwaiz1/cmp_luasnip' },
  },
  install = { colorscheme = { "catppuccin" } },
  checker = { enabled = true },
})

require("catppuccin").setup({
    transparent_background = true,
    integrations = {
	treesitter = true,
    },
})

vim.cmd.colorscheme "catppuccin"

require'nvim-treesitter.configs'.setup {
    ensure_installed = { "lua", "zig", "html", "css", "javascript" },
    highlight = {
	enable = true,
	additional_vim_regex_highlighting = false,
    },
}
require("luasnip.loaders.from_vscode").lazy_load()

local capabilities = require('cmp_nvim_lsp').default_capabilities()


vim.lsp.enable('zls')

-- vim.lsp.config('lua-language-server', {
    -- cmd = { "lua-language-server" },
    -- name = "lua-language-server",
    -- capabilities = capabilities,
-- })
-- vim.lsp.enable('lua-language-server')

-- vim.lsp.config('typescript-language-server', {
    -- cmd =  { "typescript-language-server --stdio" },
    -- name = "typescript-language-server",
    -- capabilities = capabilities,
-- })
-- vim.lsp.enable('typescript-language-server')

local cmp = require'cmp'

cmp.setup({
    snippet = {
	expand = function(args)
	    require('luasnip').lsp_expand(args.body)
	end,
    },
    window = {
	-- completion = cmp.config.window.bordered(),
	-- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
	['<C-e>'] = cmp.mapping.abort(),
	['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
	{ name = 'nvim_lsp' },
	{ name = 'luasnip' },
    }, {
	{ name = "buffer"},
    }),
})



local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>F', builtin.find_files, { desc = 'Telescope find files' })

local harpoon = require("harpoon")
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", function() mark.add_file() end)
vim.keymap.set("n", "<C-e>", function() ui.toggle_quick_menu() end)

vim.keymap.set("n", "<leader>h", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>j", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>k", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>l", function() ui.nav_file(4) end)
