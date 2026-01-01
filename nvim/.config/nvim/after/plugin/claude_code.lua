vim.keymap.set({"n", "v"}, "<leader>ac", "<cmd>ClaudeCode<cr>", { desc = "Toggle Claude Terminal" })
vim.keymap.set({"v"}, "<leader>ak", "<cmd>ClaudeCodeSend<cr>", { desc = "Send to Claude Code" })

-- Or more specific maps:
vim.keymap.set({"n", "v"}, "<leader>ao", "<cmd>ClaudeCodeOpen<cr>", { desc = "Open/Focus Claude Terminal" })
vim.keymap.set({"n", "v"}, "<leader>ax", "<cmd>ClaudeCodeClose<cr>", { desc = "Close Claude Terminal" })
