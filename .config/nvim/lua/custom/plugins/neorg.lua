return {
  -- {
  --   'vhyrro/luarocks.nvim',
  --   priority = 1000,
  --   config = true,
  --   opts = {
  --     rocks = { 'fzy' },
  --   },
  -- },
  -- {
  --   'nvim-neorg/neorg',
  --   dependencies = { 'luarocks.nvim' },
  --   lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
  --   version = '*', -- Pin Neorg to the latest stable release
  --   config = function()
  --     require('neorg').setup {
  --       load = {
  --         ['core.defaults'] = {},
  --         ['core.concealer'] = {},
  --         ['core.export'] = {},
  --         ['core.dirman'] = {
  --           config = {
  --             workspaces = {
  --               notes = '~/notes',
  --               cak = '~/code/cak/notes',
  --             },
  --           },
  --         },
  --       },
  --     }
  --   end,
  -- },
}
