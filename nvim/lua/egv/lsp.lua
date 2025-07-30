vim.lsp.config['gopls'] = {
  cmd = { "ya", "tool", "gopls", "serve" },
    settings = {gopls = {
        arcadiaIndexDirs = {
            vim.fn.expand('~/arcadia/library/go'),
            vim.fn.expand('~/arcadia/taxi/backend-go/services/daat')
        },
        expandWorkspaceToModule = false}}

}
