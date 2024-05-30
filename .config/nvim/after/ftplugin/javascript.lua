print 'Debug the afterssss'
vim.api.nvim_buf_create_user_command(0, 'Test', function()
  vim.cmd '!node %'
end, {})
vim.cmd.Test()
