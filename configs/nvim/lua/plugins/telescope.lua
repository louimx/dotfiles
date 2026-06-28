return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})

      vim.keymap.set('n', '<leader>fg', function()
          require('telescope.builtin').live_grep({
            vimgrep_arguments = {
              'rg',
              '--color=never',
              '--no-heading',
              '--with-filename',
              '--line-number',
              '--column',
              '--smart-case',
              '--fixed-strings',
              '--word-regexp',
            },
      })
        end)






      vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { desc = 'LSP References' })

      vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})

      require("telescope").load_extension("ui-select")
    end,
  },
}
