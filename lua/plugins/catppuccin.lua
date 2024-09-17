return {
 {
    "Mofiqul/dracula.nvim",
    lazy = false,
    name = "dracula",
    priority = 1000,
    config = function()
      --colorscheme = "dracula",
     vim.cmd.colorscheme "dracula"
    end
  }
}
