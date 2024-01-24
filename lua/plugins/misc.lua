return {
  {
    "numToStr/Comment.nvim",
    opts = {
      -- add any options here
    },
    lazy = false,
  },
  {
    "lewis6991/gitsigns.nvim",

    config = function()
      require("gitsigns").setup()
    end,
  },
}
