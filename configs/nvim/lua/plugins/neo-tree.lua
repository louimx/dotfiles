return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
    require("neo-tree").setup({
      enable_git_status = true,  -- Show git status in filesystem view
      filesystem = {
        filtered_items = {
          visible = true,         -- Show all files
          hide_dotfiles = false,  -- Show dotfiles (hidden files)
          hide_gitignored = false, -- Show gitignored files
        },
      },
      git_status = {
        window = {
          position = "float",    -- You can use "left", "right", "float", etc.
        },
      },
    })
      vim.keymap.set("n", "<leader>tt", ":Neotree filesystem reveal left<CR>", {})
    end,
  }
