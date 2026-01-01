return { "fatih/vim-go",
  lazy = true,
    keys = {
    { "<leader>gb", ":GoBuild<CR>", desc = "Go Build" },
    { "<leader>gr", ":GoRun<CR>", desc = "Go Run" },
  },
  config = function()
    -- Example: Enable go definition mapping and use popup for info
    vim.g.go_def_mapping_enabled = 1
    vim.g.go_info_mode = "popup"

    -- Example: Customize build command
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "go",
      callback = function()
        vim.bo.textwidth = 120
        vim.o.tabstop = 4
        vim.o.shiftwidth = 4
        vim.o.expandtab = true
      end
    })
  end
}
