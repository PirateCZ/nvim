require("catppuccin").setup({
    transparent_background = true,
    integrations = {
	treesitter = true,
    },
})

vim.cmd.colorscheme "catppuccin"

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "csharp_ls", "lwc_ls", "cssls", "quick_lint_js", "intelephense", "zls" }, 
}

local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
  }),
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").csharp_ls.setup {
  capabilities = capabilities,
}

require("lspconfig").lwc_ls.setup {
  capabilities = capabilities,
}

require("lspconfig").cssls.setup {
  capabilities = capabilities,
}

require("lspconfig").quick_lint_js.setup {
  capabilities = capabilities,
}

require("lspconfig").intelephense.setup {
  capabilities = capabilities,
}

require("lspconfig").zls.setup {
  capabilities = capabilities,
}

