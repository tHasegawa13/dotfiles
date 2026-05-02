return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    {
      "<leader>e",
      function()
        require("neo-tree.command").execute({ action = "focus", dir = LazyVim.root() })
      end,
      desc = "Explorer NeoTree (open)",
    },
    {
      "<leader>E",
      function()
        require("neo-tree.command").execute({ action = "close" })
      end,
      desc = "Explorer NeoTree (close)",
    },
  },
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
  },
}
