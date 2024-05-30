-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local bufnr = 16
vim.api.nvim_create_autocmd('BufWritePost', {
  desc = 'Run dotnet build when saving cs file',
  group = vim.api.nvim_create_augroup('build-cs', { clear = true }),
  pattern = '*.cs',
  callback = function(ev)
    local wd = vim.fn.getcwd()
    local leglob = vim.fn.glob '*.sln'
    if not vim.fn.empty(leglob) then
      print 'Solution gevonden'
    end

    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { wd, leglob })
    P(ev.file)
    -- vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { leglob })
    -- vim.fn.jobstart({ 'dotnet', 'build', '/Users/henkhouwaard/code/cak/mijnCAKActiviteiten/source/Services' }, {
    --   stdout_buffered = true,
    --   on_stdout = function(_, data)
    --     if data then
    --       vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, data)
    --     end
    --   end,
    -- })
  end,
})
