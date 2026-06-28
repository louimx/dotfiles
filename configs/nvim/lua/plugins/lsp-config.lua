return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover,
        {
          border = "rounded",  -- Options: "single", "double", "rounded", "solid", "shadow"
          max_width = 80,
          max_height = 30,
          winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
        }
      )

      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      --local lspconfig = require("lspconfig")
      --lspconfig.html.setup({
      --  capabilities = capabilities
      --})
      --lspconfig.lua_ls.setup({
      --  capabilities = capabilities
      --})
      --lspconfig.rust_analyzer.setup({
      --  capabilities = capabilities
      --})
      --lspconfig.zls.setup({
      --  capabilities = capabilities
      --})
      --lspconfig.svelte.setup({
      --  capabilities = capabilities
      --})


      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
