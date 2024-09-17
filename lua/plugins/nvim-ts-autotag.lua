return {
  "windwp/nvim-ts-autotag",
  config = function()
    local null_ls = require("nvim-ts-autotag")
    null_ls.setup({
      ["javascript"] = "html",
      ["typescript"] = "html",
      ["html"] = "html",
      ["xml"] = "html",
    })
  end,
}
