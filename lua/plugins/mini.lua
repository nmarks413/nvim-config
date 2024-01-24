return {
  "echasnovski/mini.nvim",
  config = function()
    --require("mini.comment").setup()
    require("mini.pairs").setup()
    require("mini.surround").setup()
    require("mini.cursorword").setup()
    require("mini.move").setup()
  end,
}
